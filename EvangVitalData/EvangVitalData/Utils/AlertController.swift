//
//  AlertController.swift
//  EvangVitalData
//
//  Created by 塗木冴 on 2020/02/01.
//  Copyright © 2020 塗木冴. All rights reserved.
//

import UIKit

final class AlertController {
    static let shared = AlertController()
    private init() { }

    func show(title: String = "エラー", message: String, fromViewController: UIViewController, completion: (() -> Void)?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action: UIAlertAction) -> Void in
            completion?()
        }))
        fromViewController.present(alertController, animated: true, completion: nil)
    }
}
