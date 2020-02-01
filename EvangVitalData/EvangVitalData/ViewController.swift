//
//  ViewController.swift
//  EvangVitalData
//
//  Created by 塗木冴 on 2020/01/26.
//  Copyright © 2020 塗木冴. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var sheetView: UIView!
    @IBOutlet weak var examView: UIView!
    
    var vitals: [Vital] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    @IBAction func tapExamButton(_ sender: Any) {
        if vitals.count == 0 {
            AlertController.shared
            .show(title: "要求", message: "下のボタンからデータを読み込みましょう！", fromViewController: self, completion: nil)
        }
        else {
            let viewController = ExamViewController.create(by: vitals)
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    @IBAction func tapSheetButton(_ sender: Any) {
        APIRequest.getSheetData(success: { (vitals) in
            print(vitals)
            self.vitals = vitals
            DispatchQueue.main.async {
                AlertController.shared
                    .show(title: "取得成功", message: "早速確認問題を開始してみましょう！", fromViewController: self, completion: nil)
            }
        },
        failure: { (error) in
            print(error)
            DispatchQueue.main.async {
                AlertController.shared
                    .show(title: "取得失敗", message: error, fromViewController: self, completion: nil)
            }
        })
    }
}

extension ViewController {
    
    func configureUI() {
        sheetView.layer.borderColor = UIColor.green.cgColor
        sheetView.layer.borderWidth = 2
        sheetView.layer.cornerRadius = 30.0
        sheetView.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        sheetView.layer.shadowOpacity = 0.2
        sheetView.layer.shadowColor = UIColor.black.cgColor
        sheetView.layer.shadowRadius = 5.0
        
        examView.layer.cornerRadius = 30.0
        examView.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        examView.layer.shadowOpacity = 0.2
        examView.layer.shadowColor = UIColor.black.cgColor
        examView.layer.shadowRadius = 5.0
    }
}

