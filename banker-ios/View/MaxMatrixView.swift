//
//  MaxMatrixView.swift
//  banker-ios
//
//  Created by Lex on 3/4/19.
//  Copyright © 2019 Lex. All rights reserved.
//

import UIKit

class MaxMatrixView: UIView {

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
        addSubview(exampleLabel)
        addSubview(maxMatrixTextView)
        addSubview(nextButton)
        setupInfo()
        setupExample()
        setupMaxMatrix()
        setupNext()
    }
    
    let infoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "NotoSans-Bold", size: 15)
        label.textColor = UIColor.black
        label.numberOfLines = 5
        label.textAlignment = .left
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    let exampleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "NotoSans-Bold", size: 15)
        label.textColor = UIColor.black
        label.numberOfLines = 6
        label.textAlignment = .center
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    
    let maxMatrixTextView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont(name: "NotoSans-Bold", size: 15)
        textView.textAlignment = .left
        textView.textColor = UIColor.black
        textView.backgroundColor = UIColor.banker.mainTextField
        textView.keyboardType = UIKeyboardType.numbersAndPunctuation
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
        button.addTarget(self, action: #selector(MaxMatrixController.handleNext(_:)), for: .touchUpInside)
        return button
    }()
    
    private func setupExample() {
        exampleLabel.snp.makeConstraints { (make) in
            if #available(iOS 11.0, *) {
                make.top.equalTo(self.safeAreaLayoutGuide).offset(50)
            } else {
                make.top.equalTo(self).offset(50)
            }
            make.left.right.lessThanOrEqualTo(self).inset(30)
            make.centerX.equalTo(self)
        }
    }
    
    private func setupInfo() {
        infoLabel.snp.makeConstraints { (make) in
            make.top.equalTo(exampleLabel.snp.bottom).offset(20)
            make.centerX.equalTo(self)
            make.left.right.lessThanOrEqualTo(self).inset(30)
        }
    }
    
    private func setupMaxMatrix() {
        maxMatrixTextView.snp.makeConstraints { (make) in
            make.top.equalTo(infoLabel.snp.bottom).offset(30)
            make.centerX.equalTo(self)
            make.left.right.lessThanOrEqualTo(self).inset(30)
            make.height.equalTo(140)
        }
    }
    
    private func setupNext() {
        nextButton.snp.makeConstraints { (make) in
            make.top.equalTo(maxMatrixTextView.snp.bottom).offset(40)
            make.centerX.equalTo(self)
            make.left.right.lessThanOrEqualTo(self).inset(30)
            make.height.equalTo(40)
        }
    }
}
