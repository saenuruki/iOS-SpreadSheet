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
//                print(result)
                success(result.vitals)
            } catch {
                failure(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    static func postScoreData(with exams: [Exam], success: @escaping (String) -> Void, failure: @escaping (String) -> Void) {
        print("TODO: - 後ほど記述する")
        var request = URLRequest(url: URL(string: mainAPIHost)!)
        request.httpMethod = "POST"
        
        do {
          let json = try JSONSerialization.data(withJSONObject: createJSON(with: exams), options: [])
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
    
    static func createJSON(with exams: [Exam]) -> [[String: String]] {
        let uuid = String(describing: UIDevice.current.identifierForVendor?.uuidString)
        let format = DateFormatter()
        format.dateFormat = "yyyy-MM-dd HH:mm"
        format.timeZone   = TimeZone(identifier: "Asia/Tokyo")
        let createdAt = format.string(from: Date())
        var examDictionary: [[String: String]] = [[:]]
        
        exams.forEach { exam in
            let examID = exam.questionID
            let examType = "nameJP"
            let result = exam.correctAnswer == exam.selectedAnswer ? "正解" : "不正解"
            let dict: [String: String] = [
                "deviceID": uuid,
                "createdAt": createdAt,
                "examID": examID,
                "examType": examType,
                "result": result
            ]
            examDictionary.append(dict)
        }
        return examDictionary
    }
}

