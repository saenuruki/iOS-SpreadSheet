//
//  ViewController.swift
//  EvangVitalData
//
//  Created by 塗木冴 on 2020/01/26.
//  Copyright © 2020 塗木冴. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tapButton(_ sender: Any) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Exam", bundle: nil)//遷移先のStoryboardを設定
        let nextView = storyboard.instantiateViewController(withIdentifier: "Exam") as! ExamViewController//遷移先のViewControllerを設定
        self.navigationController?.pushViewController(nextView, animated: true)
//        self.present(nextView, animated: true, completion: nil)
    }
    
}

