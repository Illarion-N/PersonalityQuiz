//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by Larik on 10/23/18.
//  Copyright © 2018 Larik. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var resultAnswerLabel: UILabel!
    @IBOutlet weak var resultDefenitionLabel: UILabel!
    var responces: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
       calculateResult()
    }
    
    func calculateResult() {
        var frequencyOfAnswers: [AnimalType: Int] = [:]
        
        let responseTypes = responces.map{$0.type}
        for responces in responseTypes {
            frequencyOfAnswers[responces] = (frequencyOfAnswers[responces] ?? 0) + 1
        }
        let frequencyOfAnswersSorted = frequencyOfAnswers.sorted(by: {
            (pair1, pair2) -> Bool in
            return pair1.value > pair2.value
        })
        print(#function, frequencyOfAnswers)
        print(#function, frequencyOfAnswersSorted)
        let mostCommonAnswer = frequencyOfAnswersSorted.first!.key
        
        resultAnswerLabel.text = "Вы — это \(mostCommonAnswer.rawValue)!"
        resultDefenitionLabel.text = mostCommonAnswer.defeniton
    }
    
}
