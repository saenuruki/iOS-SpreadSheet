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
    @IBOutlet weak var submitLabel: UILabel!
    @IBOutlet weak var submitButtonHeightConstraint: NSLayoutConstraint!
    
    fileprivate private(set) var viewModel: ExamViewModel!
    
    static func create(by vitals: [Vital]) -> UIViewController {
        let storyboard: UIStoryboard = UIStoryboard(name: "Exam", bundle: nil)//遷移先のStoryboardを設定
        let viewController = storyboard.instantiateViewController(withIdentifier: "Exam") as! ExamViewController
        viewController.viewModel = ExamViewModel(by: vitals)
        return viewController
    }
    
    lazy var customNavigationView: CustomNavigationView = {
        let nib = UINib(nibName: "CustomNavigationView", bundle: Bundle(for: type(of: self)))
        let view = nib.instantiate(withOwner: self, options: nil).first as! CustomNavigationView
        
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
    
    @IBAction func tapBottomButton(_ sender: Any) {
        if viewModel.isEnableButton {
            toggleView()
        }
        else {
            AlertController.shared
            .show(title: "要求", message: "3問全て回答しましょう！", fromViewController: self, completion: nil)
        }
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
        toggleButton()
    }
    
    func configureTableView() {
        tableView.register(UINib(nibName: "ExamTableCell", bundle: nil), forCellReuseIdentifier: "ExamTableCell")
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 300
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        tableView.reloadData()
    }
    
    func toggleButton() {
        if viewModel.isEnableButton {
            submitView.backgroundColor =  UIColor(red: 0/255, green: 199/255, blue: 89/255, alpha: 1.0)
        }
        else {
            submitView.backgroundColor =  UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1.0)
        }
    }
    
    func toggleView() {
        switch viewModel.examViewType {
        case .exam:
            print("resultに切り替える -> reloadData()")
            viewModel.examViewType = .result
            tableView.reloadData()
            submitView.backgroundColor = UIColor(red: 245/255, green: 166/255, blue: 35/255, alpha: 1.0)
            submitLabel.text = "次の問題へ"
            viewModel.postScoreData()
        case .result:
            print("新しい問題を作成する ->  examに切り替える -> reloadData()")
            viewModel.isEnableButton = false
            viewModel.refreshExams(next: { _ in
                self.viewModel.examViewType = .exam
                self.tableView.reloadData()
            })
            submitView.backgroundColor =  UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1.0)
            submitLabel.text = "解答する"
        }
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

        let cell = tableView.dequeueReusableCell(withIdentifier: "ExamTableCell", for: indexPath) as! ExamTableCell
        cell.configure(by: viewModel.exams[indexPath.row], viewType: viewModel.examViewType)
        cell.selectionStyle = .none
        cell.buttonTapHandler = { [weak self] examItem in
            guard let wself = self else { return }
            print(examItem.rawValue)
            wself.viewModel.selectItem(card: indexPath.row, row: examItem.rawValue, next: {(isEnableButton) in
                wself.toggleButton()
            })
        }
        return cell
    }
}

extension ExamViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tapしたよ")
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ExamTableCell.calcCellHeight(with: viewModel.exams[indexPath.row])
    }
}
