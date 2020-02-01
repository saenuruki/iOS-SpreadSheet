//
//  ExamTableCell.swift
//  EvangVitalData
//
//  Created by 塗木冴 on 2020/01/26.
//  Copyright © 2020 塗木冴. All rights reserved.
//

import UIKit

enum ExamItem: Int {
    case first = 0
    case second
    case third
    case fourth
}

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

    var buttonTapHandler: (ExamItem) -> Void = { _ in }

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
        buttonTapHandler(.first)
        allViews.forEach {
            if $0 == firstView {
                $0?.backgroundColor = UIColor(red: 215/255, green: 215/255, blue: 215/255, alpha: 1.0)
            }
            else {
                $0?.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)
            }
        }
    }
    
    @IBAction func tapSecondButton(_ sender: Any) {
        buttonTapHandler(.second)
        allViews.forEach {
            if $0 == secondView {
                $0?.backgroundColor = UIColor(red: 215/255, green: 215/255, blue: 215/255, alpha: 1.0)
            }
            else {
                $0?.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)
            }
        }
    }
    
    @IBAction func tapThirdButton(_ sender: Any) {
        buttonTapHandler(.third)
        allViews.forEach {
            if $0 == thirdView {
                $0?.backgroundColor = UIColor(red: 215/255, green: 215/255, blue: 215/255, alpha: 1.0)
            }
            else {
                $0?.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)
            }
        }
    }
    
    @IBAction func tapFourthButton(_ sender: Any) {
        buttonTapHandler(.fourth)
        allViews.forEach {
            if $0 == fourthView {
                $0?.backgroundColor = UIColor(red: 215/255, green: 215/255, blue: 215/255, alpha: 1.0)
            }
            else {
                $0?.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)
            }
        }
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

