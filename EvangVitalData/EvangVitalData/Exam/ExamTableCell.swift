//
//  ExamTableCell.swift
//  EvangVitalData
//
//  Created by 塗木冴 on 2020/01/26.
//  Copyright © 2020 塗木冴. All rights reserved.
//

import UIKit

class ExamTableCell: UITableViewCell {
    
    static let cellHeight: CGFloat = 300

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    @IBOutlet weak var fourthButton: UIButton!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var thirdView: UIView!
    @IBOutlet weak var fourthView: UIView!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    @IBOutlet weak var fourthLabel: UILabel!
    
    lazy var allButtons: [UIButton?] = {
        let buttons = [firstButton, secondButton, thirdButton, fourthButton]
        return buttons
    }()
    lazy var allViews: [UIView?] = {
        let views = [firstView, secondView, thirdView, fourthView]
        return views
    }()
    lazy var allLabels: [UILabel?] = {
        let labels = [firstLabel, secondLabel, thirdLabel, fourthLabel]
        return labels
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        confgireUI()
//        configureButton()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
    }

    func configure(by exam: Exam) {
        questionLabel.text = exam.questionText
        firstLabel.text = exam.answers[0]
        secondLabel.text = exam.answers[1]
        thirdLabel.text = exam.answers[2]
        fourthLabel.text = exam.answers[3]
    }
    
    @IBAction func tapFirstButton(_ sender: Any) {
        print("tap1")
    }
    
    @IBAction func tapSecondButton(_ sender: Any) {
        print("tap2")
    }
    
    @IBAction func tapThirdButton(_ sender: Any) {
        print("tap3")
    }
    
    @IBAction func tapFourthButton(_ sender: Any) {
        print("tap4")
    }
}

fileprivate extension ExamTableCell {

    func confgireUI() {
        cardView.layer.cornerRadius = 8.0
        cardView.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        cardView.layer.shadowOpacity = 0.2
        cardView.layer.shadowColor = UIColor.black.cgColor
        cardView.layer.shadowRadius = 5.0
        
        allViews.forEach {
            guard let view = $0 else { return }
            view.layer.cornerRadius = 2
            view.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
            view.layer.shadowOpacity = 0.2
            view.layer.shadowColor = UIColor.black.cgColor
            view.layer.shadowRadius = 2.0
        }
    }
}

