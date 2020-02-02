//
//  APIRequest.swift
//  EvangVitalData
//
//  Created by 塗木冴 on 2020/01/27.
//  Copyright © 2020 塗木冴. All rights reserved.
//

import UIKit

struct APIRequest {

    static let mainAPIHost: String = Constant.sheetURL
    
    static func getSheetData(success: @escaping ([Vital]) -> Void, failure: @escaping (String) -> Void) {
                
        var request = URLRequest(url: URL(string: mainAPIHost)!)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let jsonData = data else { return }
            
            struct Result: Codable {
                var vitals: [Vital]
            }
            
            do {
                let result = try JSONDecoder().decode(Result.self, from: jsonData)
                success(result.vitals)
            } catch {
                failure(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    static func postScoreData(with exams: [Exam], success: @escaping (String) -> Void, failure: @escaping (String) -> Void) {

        var request = URLRequest(url: URL(string: mainAPIHost)!)
        request.httpMethod = "POST"
        
        let jsonDict =  createJSON(with: exams)
        
        do {
          let json = try JSONSerialization.data(withJSONObject: jsonDict, options: [])
          request.httpBody = json
        } catch {
          failure("Error: cannot create JSON from todo")
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let jsonData = data else { return }
            
            struct Result: Codable {
                var message: String
            }
                        
            do {
                let result = try JSONDecoder().decode(Result.self, from: jsonData)
                success(result.message)
            } catch {
                failure(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    static func createJSON(with exams: [Exam]) -> [String: String] {
        let uuid = String(describing: UIDevice.current.identifierForVendor?.uuidString ?? "")
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd HH:mm"
        format.timeZone   = TimeZone(identifier: "Asia/Tokyo")
        let createdAt = format.string(from: Date())
        
        let examID1 = exams[0].questionID
        let examID2 = exams[1].questionID
        let examID3 = exams[2].questionID
        
        let examType1 = "nameJP"
        let examType2 = "discription"
        let examType3 = "usage"
        
        let result1 = exams[0].correctAnswer == exams[0].selectedAnswer ? "正解" : "不正解"
        let result2 = exams[1].correctAnswer == exams[1].selectedAnswer ? "正解" : "不正解"
        let result3 = exams[2].correctAnswer == exams[2].selectedAnswer ? "正解" : "不正解"

        let examDictionary: [String: String] = [
            "deviceID": uuid,
            "createdAt": createdAt,
            "examID1": examID1,
            "examID2": examID2,
            "examID3": examID3,
            "examType1": examType1,
            "examType2": examType2,
            "examType3": examType3,
            "result1": result1,
            "result2": result2,
            "result3": result3
        ]
        
        return examDictionary
    }
}

