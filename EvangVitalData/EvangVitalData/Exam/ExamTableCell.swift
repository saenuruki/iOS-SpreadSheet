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
    @IBOutlet weak var resultMarkImageView: UIImageView!
    
    var viewType: ExamViewType = .exam
    
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

    func configure(by exam: Exam, viewType: ExamViewType) {
        questionLabel.text = exam.questionText
        firstLabel.text = exam.answers[0]
        secondLabel.text = exam.answers[1]
        thirdLabel.text = exam.answers[2]
        fourthLabel.text = exam.answers[3]
        self.viewType = viewType
        
        switch viewType {
        case .exam:
            allViews.forEach { // MEMO: - 初期値は全て同じ色
                $0?.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)
            }
            resultMarkImageView.isHidden = true
        case .result:
            setButtonColor(with: exam, row: 0, buttonView: firstView)
            setButtonColor(with: exam, row: 1, buttonView: secondView)
            setButtonColor(with: exam, row: 2, buttonView: thirdView)
            setButtonColor(with: exam, row: 3, buttonView: fourthView)
            resultMarkImageView.isHidden = false
            if exam.correctAnswer == exam.selectedAnswer {
                resultMarkImageView.image = R.image.icon_circle()
            }
            else {
                resultMarkImageView.image = R.image.icon_cross()
            }
        }
    }
    
    @IBAction func tapFirstButton(_ sender: Any) {
        if viewType == .exam {
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
    }
    
    @IBAction func tapSecondButton(_ sender: Any) {
        if viewType == .exam {
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
    }
    
    @IBAction func tapThirdButton(_ sender: Any) {
        if viewType == .exam {
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
    }
    
    @IBAction func tapFourthButton(_ sender: Any) {
        if viewType == .exam {
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
    
    func setButtonColor(with exam: Exam, row: Int, buttonView: UIView) {
        if exam.correctAnswer == exam.answers[0] {
            buttonView.backgroundColor = UIColor(red: 0/255, green: 199/255, blue: 89/255, alpha: 1.0)
        }
        else if exam.selectedAnswer == exam.answers[0] {
            buttonView.backgroundColor = UIColor(red: 215/255, green: 215/255, blue: 215/255, alpha: 1.0)
        }
        else {
            buttonView.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1.0)
        }
    }
}

