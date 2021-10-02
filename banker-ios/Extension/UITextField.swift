//
//  UITextField.swift
//  banker-ios
//
//  Created by Lex on 3/4/19.
//  Copyright © 2019 Lex. All rights reserved.
//

import UIKit
import Hex

extension UITextField {
    
    public convenience init(placeholder: String, keyboardType: UIKeyboardType = UIKeyboardType.default, autoCorrectionType: UITextAutocorrectionType = UITextAutocorrectionType.no, autoCapitalizationType: UITextAutocapitalizationType = UITextAutocapitalizationType.none) {
        self.init()
        self.placeholder = placeholder
        self.keyboardType = keyboardType
        self.autocorrectionType = autoCorrectionType
        self.autocapitalizationType = autoCapitalizationType
        self.font = UIFont(name: "NotoSans", size: 15)
        self.textColor = UIColor.banker.mainBlack
        self.backgroundColor = UIColor.banker.mainTextField
        self.textAlignment = .left
        self.clearButtonMode = .whileEditing
        self.borderStyle = .none
        self.layer.cornerRadius = 5 
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.banker.mainLightGrey.cgColor
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
        self.leftView = paddingView
        self.rightView = paddingView
        self.leftViewMode = UITextField.ViewMode.always
        self.leftViewMode = UITextField.ViewMode.always
    }
}
