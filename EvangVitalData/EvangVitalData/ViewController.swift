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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    @IBAction func tapExamButton(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Exam", bundle: nil)//遷移先のStoryboardを設定
        let nextView = storyboard.instantiateViewController(withIdentifier: "Exam") as! ExamViewController//遷移先のViewControllerを設定
        self.navigationController?.pushViewController(nextView, animated: true)
//        self.present(nextView, animated: true, completion: nil)
    }
    
    @IBAction func tapSheetButton(_ sender: Any) {
        print("TODO: - request Sheet Data")
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

