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
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var submitView: UIView!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var submitButtonHeightConstraint: NSLayoutConstraint!
    
    fileprivate private(set) var viewModel: ExamViewModel!
    
    static func create(by vitals: [Vital]) -> UIViewController {
        let storyboard: UIStoryboard = UIStoryboard(name: "Exam", bundle: nil)//遷移先のStoryboardを設定
        let viewController = storyboard.instantiateViewController(withIdentifier: "Exam") as! ExamViewController//遷移先のViewControllerを設定
        viewController.viewModel = ExamViewModel(by: vitals)
        return viewController
    }
    
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
        configureTableView()
        viewModel.refreshExams(next: {_ in })
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
        
        let bottomHeight = UIApplication.shared.keyWindow?.rootViewController?.view.safeAreaInsets.bottom ?? 0
        submitButtonHeightConstraint.constant = bottomHeight + 48
    }
    
    func configureTableView() {
        tableView.register(R.nib.examTableCell)
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 300
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tableView.reloadData()
    }
}

extension ExamViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.examTableCell, for: indexPath) else { return UITableViewCell() }
        cell.configure(by: viewModel.exams[indexPath.row])
        cell.selectionStyle = .none
        cell.buttonTapHandler = { [weak self] examItem in
            guard let wself = self else { return }
            print(examItem.rawValue)
            wself.viewModel.selectItem(card: indexPath.row, row: examItem.rawValue)
        }
        return cell
    }
}

extension ExamViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tapしたよ")
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ExamTableCell.cellHeight
    }
}
