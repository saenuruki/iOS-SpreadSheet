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
    
    static func postScoreData() {
        print("TODO: - 後ほど記述する")
    }
}

