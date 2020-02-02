//
//  CustomNavigationView.swift
//  EvangVitalData
//
//  Created by 塗木冴 on 2020/01/26.
//  Copyright © 2020 塗木冴. All rights reserved.
//

import UIKit

class CustomNavigationView: UIView {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var leftButton: UIButton!
    
    var title: String {
        set { titleLabel.text = newValue }
        get { return titleLabel.text ?? "" }
    }
    
    var leftButtonHandler: () -> Void = {}

    @IBAction func tapLeftButton(_ sender: Any) {
        leftButtonHandler()
    }
   
}
