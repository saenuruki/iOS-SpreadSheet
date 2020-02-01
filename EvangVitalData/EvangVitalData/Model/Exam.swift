//
//  Exam.swift
//  EvangVitalData
//
//  Created by 塗木冴 on 2020/01/29.
//  Copyright © 2020 塗木冴. All rights reserved.
//

import Foundation

enum ExamType {
    case nameJP
    case discription
    case usage
}

struct Exam {
    var question: String = ""
    var questionID: String = ""
    var correctAnswer: String = ""
    var answers: [String] = []
    var selectedAnswer: String = ""
    
    init(contents: [Vital], type: ExamType) {
        if contents.count >= 4 {
            question = contents[0].name
            questionID = contents[0].id
            answers.removeAll() // MEMO: - 初期化
            
            switch type {
            case .nameJP:
                correctAnswer = contents[0].nameJP
                contents.forEach {
                    answers.append($0.nameJP)
                }
            case .discription:
                correctAnswer = contents[0].description
                contents.forEach {
                    answers.append($0.description)
                }
            case .usage:
                correctAnswer = contents[0].usage
                contents.forEach {
                    answers.append($0.usage)
                }
            }
        }
    }
}