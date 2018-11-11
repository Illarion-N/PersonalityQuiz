//
//  QuestionData.swift
//  PersonalityQuiz
//
//  Created by Larik on 10/23/18.
//  Copyright © 2018 Larik. All rights reserved.
//

import Foundation

struct Questions {
    var text: String
    var type: responceType
    var answer: [Answer]
}

enum responceType {
    case single, multiply, ranged
}

struct Answer {
    var text: String
    var type: AnimalType
}

enum AnimalType: Character {
    case dog = "🐶", cat = "🐱", rabbit = "🐰", turtle = "🐢"
    
    var defeniton: String {
        switch self {
        case .dog:
            return "Вы невероятно удивительный человек, любящий постоянно напоминать окружающим вам людям какой хороший друг вы на самом деле."
        case .cat:
            return "Вы являетесь самостоятельным человеком, неприхотливым во внимании и общение. Всегда найдете0 чем можно заняться."
        case .rabbit:
            return "Ваша жизнь наполнена огромным количесвом переполнаяющих вас событий, поэтому вы всегда стараетесь никогда не опаздывать."
        case .turtle:
            return "Вы наслождаетесь каждым мнгновенией вашей жизни и не спешите двигаться дальше."
        }
    }
}
