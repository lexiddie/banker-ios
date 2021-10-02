//
//  MainNavigationItem.swift
//  banker-ios
//
//  Created by Lex on 2/4/19.
//  Copyright © 2019 Lex. All rights reserved.
//

import UIKit

extension MainController {

    func setupNavigationItems() {
        setupTitleNavItem()
    }
    
    private func setupTitleNavItem() {
        let label = UILabel()
        label.text = "SOKVATHARALIN 6018002"
        label.textColor = UIColor.black
        label.font = UIFont(name: "NotoSans-Bold", size: 17)
        navigationItem.titleView = label
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    }
}
