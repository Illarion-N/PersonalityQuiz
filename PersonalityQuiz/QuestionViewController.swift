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
    
    @IBOutlet weak var rangedStackView: UIStackView!
    @IBOutlet var rangedLabel: [UILabel]!
    
    @IBOutlet weak var progressView: UIProgressView!
    
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
        Questions(text: "Любители вы кататься на машине?",
                  type: .ranged,
                  answer: [
                    Answer(text: "Ненавижу", type: .cat),
                    Answer(text: "Терпеть не могу", type: .rabbit),
                    Answer(text: "Люблю на высокой скорости", type: .turtle),
                    Answer(text: "Обожаю", type: .dog),
            ]
        ),
        ]
    
    var questionIndex = 2
    
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
        }
    }
    func updateRangedStack(using answer: [Answer]) {
          rangedStackView.isHidden = false
       rangedLabel[0].text = answer.first?.text
        rangedLabel[1].text = answer.last?.text
    }
}
