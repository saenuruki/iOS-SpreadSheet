//
//  ExamViewController.swift
//  EvangVitalData
//
//  Created by 塗木冴 on 2020/01/26.
//  Copyright © 2020 塗木冴. All rights reserved.
//

import UIKit
import SnapKit

class ExamViewController: UIViewController {
    
    lazy var customNavigationView: CustomNavigationView = {
        let view = R.nib.customNavigationView.firstView(owner: nil)!
        view.title = "本日の確認問題"
        view.leftButtonHandler = { [weak self] in
            guard let wself = self else { return }
            wself.navigationController?.popViewController(animated: true)
        }
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(customNavigationView)
        configureUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ExamViewController {
    
    func configureUI() {
        let statusBarHeight = UIApplication.shared.statusBarFrame.size.height
        let viewHeight = statusBarHeight + 60
        customNavigationView.snp.makeConstraints { (make: ConstraintMaker) in
            make.left.top.right.equalToSuperview()
            make.height.equalTo(viewHeight)
        }
    }
}
