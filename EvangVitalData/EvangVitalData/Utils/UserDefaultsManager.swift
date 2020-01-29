//
//  UserDefaultsManager.swift
//  EvangVitalData
//
//  Created by 塗木冴 on 2020/01/29.
//  Copyright © 2020 塗木冴. All rights reserved.
//

import Foundation

struct UserDefaultsManager {
    private static let userDefault = Foundation.UserDefaults.standard

    private static let vitalsKey = "evangVitalData.vitalsKey"

    static var vitals: [Vital] {
        get {
            return self.userDefault.array(forKey: vitalsKey) as! [Vital]
        }
        set {
            self.userDefault.set(newValue, forKey: vitalsKey)
            self.userDefault.synchronize()
        }
    }
}
