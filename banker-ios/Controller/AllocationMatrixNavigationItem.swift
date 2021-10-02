//
//  AllocationMatrixNavigationItem.swift
//  banker-ios
//
//  Created by Lex on 3/4/19.
//  Copyright © 2019 Lex. All rights reserved.
//

import UIKit

extension AllocationMatrixController {
    
    func setupNavigationItems() {
        setupTitleNavItem()
        setupLeftBarItem()
        setupRightBarItem()
    }
    
    private func setupTitleNavItem() {
        let label = UILabel()
        label.text = "Allocation Matrix"
        label.textColor = UIColor.black
        label.font = UIFont(name: "NotoSans-Bold", size: 17)
        navigationItem.titleView = label
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    }
    
    private func setupLeftBarItem() {
        let button = UIButton(type: .system)
        button.setTitle("Back", for: .normal)
        button.setTitleColor(UIColor.banker.mainRed, for: .normal)
        button.titleLabel?.font = UIFont(name: "NotoSans", size: 15)
        button.contentMode = .scaleAspectFit
        button.backgroundColor = UIColor.clear
        button.addTarget(self, action: #selector(AllocationMatrixController.handleBack(_:)), for: .touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        button.snp.makeConstraints{ (make) in
            make.height.width.equalTo(35)
        }
    }
    
    private func setupRightBarItem() {
        let button = UIButton(type: .system)
        button.setTitle("Random", for: .normal)
        button.setTitleColor(UIColor.banker.mainRed, for: .normal)
        button.titleLabel?.font = UIFont(name: "NotoSans", size: 15)
        button.contentMode = .scaleAspectFit
        button.backgroundColor = UIColor.clear
        button.addTarget(self, action: #selector(AllocationMatrixController.handleRandom(_:)), for: .touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
        button.snp.makeConstraints{ (make) in
            make.height.equalTo(35)
            make.width.equalTo(70)
        }
    }
}
