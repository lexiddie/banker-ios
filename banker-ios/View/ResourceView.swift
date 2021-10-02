//
//  ResourceView.swift
//  banker-ios
//
//  Created by Lex on 3/4/19.
//  Copyright © 2019 Lex. All rights reserved.
//

import UIKit

class ResourceView: UIView {

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
        addSubview(resourceValueTextField)
        addSubview(nextButton)
        setupInfo()
        setupResourceValue()
        setupNext()
    }
    
    let infoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "NotoSans-Bold", size: 15)
        label.textColor = UIColor.black
        label.numberOfLines = 2
        label.textAlignment = .center
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    let resourceValueTextField: UITextField  = {
        let textfield = UITextField(placeholder: "Input each value with space", keyboardType: UIKeyboardType.numbersAndPunctuation)
        textfield.text = "13 1 4 3"
        return textfield
    }()
    
    let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.titleLabel?.font = UIFont(name: "NotoSans", size: 15)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.banker.mainRed
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(ResourceController.handleNext(_:)), for: .touchUpInside)
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
    
    private func setupResourceValue() {
        resourceValueTextField.snp.makeConstraints { (make) in
            make.top.equalTo(infoLabel.snp.bottom).offset(30)
            make.left.right.lessThanOrEqualTo(self).inset(30)
            make.centerX.equalTo(self)
            make.height.equalTo(40)
        }
    }
    
    private func setupNext() {
        nextButton.snp.makeConstraints { (make) in
            make.top.equalTo(resourceValueTextField.snp.bottom).offset(45)
            make.left.right.lessThanOrEqualTo(self).inset(30)
            make.centerX.equalTo(self)
            make.height.equalTo(40)
        }
    }
    
}
