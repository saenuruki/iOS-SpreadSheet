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
    var questionText: String = ""
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
                questionText = "Q1. 「\(contents[0].name)」の日本語訳はどれでしょうか。"
                correctAnswer = contents[0].nameJP
                let shuffledContents =  Array(contents.shuffled())
                shuffledContents.forEach {
                    answers.append($0.nameJP)
                }
            case .discription:
                questionText = "Q2. 「\(contents[0].name)」の説明はどれでしょうか。"
                correctAnswer = contents[0].description
                let shuffledContents =  Array(contents.shuffled())
                shuffledContents.forEach {
                    answers.append($0.description)
                }
            case .usage:
                questionText = "Q3. 「\(contents[0].name)」の利用例はどれでしょうか。"
                correctAnswer = contents[0].usage
                let shuffledContents =  Array(contents.shuffled())
                shuffledContents.forEach {
                    answers.append($0.usage)
                }
            }
        }
    }
}
