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
        let task = URLSession.shared.dataTask(with: request, completionHandler: {
            (data, response, error) in
            if error != nil {
                print(error as Any)
                return
            }
            print("response: \(response!)")
            
            let decodedOutput = String(data: data!, encoding: .utf8)!
            
            print("decoded output: \(decodedOutput)")
            
            struct NewJson: Codable {
                var celstr: String
            }
            
            let data: Data = data!
            let decoder: JSONDecoder = JSONDecoder()
            do {
                let newJson: NewJson = try decoder.decode(NewJson.self, from: data)
                print(newJson)
                print(newJson.celstr)
                
            } catch {
                print("json convert failed in JSONDecoder", error.localizedDescription)
            }
        })
        task.resume()
    }
    
    func postScoreData() {
        print("TODO: - 後ほど記述する")
    }
}

