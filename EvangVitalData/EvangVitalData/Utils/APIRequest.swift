//
//  APIRequest.swift
//  EvangVitalData
//
//  Created by 塗木冴 on 2020/01/27.
//  Copyright © 2020 塗木冴. All rights reserved.
//

import Foundation

struct APIRequest {

    static let mainAPIHost: String = Constant.sheetURL
    
    static func getSheetData(){
                
        var request = URLRequest(url: URL(string: mainAPIHost)!)
        request.httpMethod = "GET"
        var vitalArray:[Vital] = []
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let jsonData = data else { return }
            print("jsonData: \(jsonData)")
            
            print("response: \(response!)")
            
            let decodedOutput = String(data: data!, encoding: .utf8)!
            
            print("decoded output: \(decodedOutput)")
            
            struct NewJson: Codable {
                var result: [Vital]
            }
            
            do {
                let vitals = try JSONDecoder().decode(NewJson.self, from: jsonData)
                print(vitals)
//                vitalArray.append(vitals)
                print("TODO: - UserDefaultに保存する")
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    func postScoreData() {
        print("TODO: - 後ほど記述する")
    }
}

