//
//  QuestionViewController.swift
//  PersonalityQuiz
//
//  Created by Larik on 10/23/18.
//  Copyright © 2018 Larik. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {

    @IBOutlet weak var QuestionLabel: UILabel!
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet var singleButton: [UIButton]!
    @IBOutlet weak var multiplyStackView: UIStackView!
    @IBOutlet var multiplyLabel: [UILabel]!
    @IBOutlet var multiplySwitches: [UISwitch]!
    @IBOutlet weak var rangedStackView: UIStackView!
    @IBOutlet weak var renegedSlider: UISlider!
    @IBOutlet var rangedLabel: [UILabel]!
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBAction func singleButtonPressed(_ sender: UIButton) {
        let anwers = questions[questionIndex].answer
        
        for index in 0..<singleButton.count {
            if singleButton[index] == sender {
                answersChosen.append(anwers[index])
                break
            }
        }
        
        nextQuestion()
    }
    
    @IBAction func multiplyButtonPressed() {
        let answers = questions[questionIndex].answer
        
        for index in 0..<multiplySwitches.count {
            if multiplySwitches[index].isOn {
                answersChosen.append(answers[index])
            }
        }
        
        nextQuestion()
    }
    
    @IBAction func rengedButtonPressed() {
        let answers = questions[questionIndex].answer
        
        let index = Int(round(renegedSlider.value * Float(answers.count - 1)))
        answersChosen.append(answers[index])
        
        nextQuestion()
        
    }
    
    
    var questions: [Questions] = [
        Questions(text: "Какая еда вам нравится?",
                  type: .single,
                  answer: [
                    Answer(text: "Мясо", type: .dog),
                     Answer(text: "Рыба", type: .cat),
                     Answer(text: "Морковь", type: .rabbit),
                     Answer(text: "Салат", type: .turtle)
            ]
        ),
        Questions(text: "Что вы любите делать?",
                  type: .multiply,
                  answer: [
                    Answer(text: "Плавать", type: .turtle),
                    Answer(text: "Играть", type: .dog),
                    Answer(text: "Бегать", type: .rabbit),
                    Answer(text: "Охотиться", type: .cat),
            ]
        ),
        Questions(text: "Любите ли вы кататься на машине?",
                  type: .ranged,
                  answer: [
                    Answer(text: "Ненавижу", type: .cat),
                    Answer(text: "Терпеть не могу", type: .rabbit),
                    Answer(text: "Люблю на высокой скорости", type: .turtle),
                    Answer(text: "Обожаю", type: .dog),
            ]
        ),
        ]
    
    var questionIndex = 0
    
    var answersChosen: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

       updateUI()
    }
    
    func updateUI() {
        singleStackView.isHidden = true
        multiplyStackView.isHidden = true
        rangedStackView.isHidden = true
        
        let question = questions[questionIndex]
        let answers = question.answer
        let progress = Float(questionIndex) / Float(questions.count)
        navigationItem.title = "Вопрос № \(questionIndex + 1)"
        QuestionLabel.text = question.text
        progressView.setProgress(progress, animated: true)
        switch question.type {
        case .single:
           updateSinglStack(using: answers)
        case .multiply:
            updateMultiplyStack(using: answers)
        case .ranged:
          updateRangedStack(using: answers)
        }
    }

    func updateSinglStack(using answer: [Answer]) {
           singleStackView.isHidden = false
        for index in 0..<singleButton.count {
            singleButton[index].setTitle(
                answer[index].text,
                for: .normal)
        }
    }
    func updateMultiplyStack(using answer: [Answer]) {
          multiplyStackView.isHidden = false
        for index in 0..<answer.count {
        multiplyLabel[index].text = answer[index].text
            multiplySwitches[index].isOn = false
        }
    }
    func updateRangedStack(using answer: [Answer]) {
          rangedStackView.isHidden = false
        renegedSlider.setValue(0.5, animated: false)
       rangedLabel[0].text = answer.first?.text
        rangedLabel[1].text = answer.last?.text
    }
    func nextQuestion() {
        questionIndex += 1
        if questionIndex < questions.count  {
            updateUI()
        } else {
            performSegue(withIdentifier: "ResultsSegue", sender: nil)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResultsSegue" {
            let resultsViewController = segue.destination as? ResultsViewController
            resultsViewController?.responces = answersChosen
            
        }
    }
}
