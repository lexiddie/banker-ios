//
//  AllocationMatrixView.swift
//  banker-ios
//
//  Created by Lex on 3/4/19.
//  Copyright © 2019 Lex. All rights reserved.
//

import UIKit

class AllocationMatrixView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        backgroundColor = UIColor.white
        addSubview(infoLabel)
        addSubview(maxLabel)
        addSubview(maxMatrixLabel)
        addSubview(allocationTextView)
        addSubview(nextButton)
        setupInfo()
        setupMax()
        setupMaxMatrix()
        setupAllocation()
        setupNext()
    }
    
    let infoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "NotoSans-Bold", size: 15)
        label.textColor = UIColor.black
        label.numberOfLines = 1
        label.textAlignment = .center
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    let maxLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "NotoSans-Bold", size: 15)
        label.textColor = UIColor.black
        label.numberOfLines = 3
        label.textAlignment = .left
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    let maxMatrixLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "NotoSans-Bold", size: 15)
        label.textColor = UIColor.black
        label.numberOfLines = 10
        label.textAlignment = .center
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    let allocationTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont(name: "NotoSans-Bold", size: 15)
        textView.textAlignment = .left
        textView.textColor = UIColor.black
        textView.keyboardType = UIKeyboardType.numbersAndPunctuation
        textView.backgroundColor = UIColor.banker.mainTextField
        textView.sizeToFit()
        textView.layoutIfNeeded()
        textView.isEditable = true
        textView.layer.cornerRadius = 5
        textView.layer.borderWidth = 1
        textView.isScrollEnabled = false
        textView.layer.borderColor = UIColor.banker.mainLightGrey.cgColor
        return textView
    }()
    
    let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.titleLabel?.font = UIFont(name: "NotoSans", size: 15)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.banker.mainRed
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(AllocationMatrixController.handleNext(_:)), for: .touchUpInside)
        return button
    }()
    
    private func setupInfo() {
        infoLabel.snp.makeConstraints { (make) in
            if #available(iOS 11.0, *) {
                make.top.equalTo(self.safeAreaLayoutGuide).offset(50)
            } else {
                make.top.equalTo(self).offset(50)
            }
            make.left.right.lessThanOrEqualTo(self).inset(30)
            make.centerX.equalTo(self)
        }
    }
    
    private func setupMax() {
        maxLabel.snp.makeConstraints { (make) in
            make.top.equalTo(infoLabel.snp.bottom).offset(20)
            make.left.right.lessThanOrEqualTo(self).inset(30)
            make.centerX.equalTo(self)
        }
    }
    
    private func setupMaxMatrix() {
        maxMatrixLabel.snp.makeConstraints { (make) in
            make.top.equalTo(maxLabel.snp.bottom).offset(20)
            make.left.right.lessThanOrEqualTo(self).inset(30)
            make.centerX.equalTo(self)
        }
    }
    
    private func setupAllocation() {
        allocationTextView.snp.makeConstraints { (make) in
            make.top.equalTo(maxMatrixLabel.snp.bottom).offset(30)
            make.centerX.equalTo(self)
            make.left.right.lessThanOrEqualTo(self).inset(30)
            make.height.equalTo(140)
        }
    }
    
    private func setupNext() {
        nextButton.snp.makeConstraints { (make) in
            make.top.equalTo(allocationTextView.snp.bottom).offset(40)
            make.centerX.equalTo(self)
            make.left.right.lessThanOrEqualTo(self).inset(30)
            make.height.equalTo(40)
        }
    }

}
