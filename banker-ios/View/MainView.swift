//
//  MainView.swift
//  banker-ios
//
//  Created by Lex on 2/4/19.
//  Copyright © 2019 Lex. All rights reserved.
//

import UIKit
import SnapKit

class MainView: UIView {

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
        addSubview(processTextField)
        addSubview(resourceTextField)
        addSubview(nextButton)
        setupInfo()
        setupProcess()
        setupResource()
        setupNext()
    }
    
    let infoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "NotoSans-Bold", size: 18)
        label.text = "Banker Algorithm"
        label.textColor = UIColor.black
        label.numberOfLines = 1
        label.textAlignment = .center
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    let processTextField: UITextField  = {
        let textfield = UITextField(placeholder: "Enter process number", keyboardType: UIKeyboardType.numberPad)
        textfield.text = "5"
        return textfield
    }()
    
    let resourceTextField: UITextField  = {
        let textfield = UITextField(placeholder: "Enter resource number", keyboardType: UIKeyboardType.numberPad)
        textfield.text = "4"
        return textfield
    }()
    
    let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.titleLabel?.font = UIFont(name: "NotoSans", size: 15)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.banker.mainRed
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(MainController.handleNext(_:)), for: .touchUpInside)
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
    
    private func setupProcess() {
        processTextField.snp.makeConstraints { (make) in
            make.top.equalTo(infoLabel.snp.bottom).offset(30)
            make.left.right.lessThanOrEqualTo(self).inset(30)
            make.centerX.equalTo(self)
            make.height.equalTo(40)
        }
    }
    
    private func setupResource() {
        resourceTextField.snp.makeConstraints { (make) in
            make.top.equalTo(processTextField.snp.bottom).offset(30)
            make.left.right.lessThanOrEqualTo(self).inset(30)
            make.centerX.equalTo(self)
            make.height.equalTo(40)
        }
    }
    
    private func setupNext() {
        nextButton.snp.makeConstraints { (make) in
            make.top.equalTo(resourceTextField.snp.bottom).offset(45)
            make.left.right.lessThanOrEqualTo(self).inset(30)
            make.centerX.equalTo(self)
            make.height.equalTo(40)
        }
    }
}
