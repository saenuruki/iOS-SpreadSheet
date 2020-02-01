//
//  ExamViewModel.swift
//  EvangVitalData
//
//  Created by 塗木冴 on 2020/01/26.
//  Copyright © 2020 塗木冴. All rights reserved.
//

import Foundation

class ExamViewModel {

    var vitals: [Vital] = []
    var exams: [Exam] = []
    var isEnableButton: Bool = false
    
    init(by vitals: [Vital]) {
        
        self.vitals = vitals
        
    }
}

extension ExamViewModel {
    
    func refreshExams(next: @escaping ([Exam]) -> Void) {
        let exams = [createExam(type: .nameJP), createExam(type: .discription), createExam(type: .usage)]
        self.exams = exams
        next(exams)
    }
    
    func createExam(type: ExamType) -> Exam {
        let filtteredVitals = Array(vitals.shuffled().prefix(4))
        let exam = Exam(contents: filtteredVitals, type: type)
        return exam
    }
    
    func selectItem(card: Int, row: Int, next: @escaping (Bool) -> Void) {
        
        if card == 0 {
            var updateExam = exams[0]
            updateExam.selectedAnswer = updateExam.answers[row]
            let newExams = [updateExam, exams[1], exams[2]]
            self.exams = newExams
        }
        else if card == 1 {
            var updateExam = exams[1]
            updateExam.selectedAnswer = updateExam.answers[row]
            let newExams = [exams[0], updateExam, exams[2]]
            self.exams = newExams
        }
        else {
            var updateExam = exams[2]
            updateExam.selectedAnswer = updateExam.answers[row]
            let newExams = [exams[0], exams[1], updateExam]
            self.exams = newExams
        }
        next(toggleButtonStatus())
    }
    
    func toggleButtonStatus() -> Bool {
        if exams[0].selectedAnswer != "" && exams[1].selectedAnswer != "" && exams[2].selectedAnswer != "" {
            isEnableButton =  true // MEMO: - ３問とも回答した場合に「提出ボタンを有効にする」
        }
        else {
            isEnableButton =  false
        }
        return isEnableButton
    }
}
