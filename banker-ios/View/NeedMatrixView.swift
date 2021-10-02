//
//  NeedMatrixView.swift
//  banker-ios
//
//  Created by Lex on 3/4/19.
//  Copyright © 2019 Lex. All rights reserved.
//

import UIKit

class NeedMatrixView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayout() {
        backgroundColor = UIColor.white
        addSubview(maxLabel)
        addSubview(allocationLabel)
        addSubview(needLabel)
        addSubview(availableLabel)
        addSubview(sequenceLabel)
        setupMax()
        setupAllocation()
        setupNeed()
        setupAvailable()
        setupSequence()
    }
    
    let maxLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "NotoSans-Bold", size: 15)
        label.textColor = UIColor.black
        label.numberOfLines = 10
        label.textAlignment = .center
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    let allocationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "NotoSans-Bold", size: 15)
        label.textColor = UIColor.black
        label.numberOfLines = 10
        label.textAlignment = .center
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    let needLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "NotoSans-Bold", size: 15)
        label.textColor = UIColor.black
        label.numberOfLines = 10
        label.textAlignment = .center
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    let availableLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "NotoSans-Bold", size: 15)
        label.textColor = UIColor.black
        label.numberOfLines = 10
        label.textAlignment = .center
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    let sequenceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "NotoSans-Bold", size: 15)
        label.textColor = UIColor.black
        label.numberOfLines = 3
        label.textAlignment = .center
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    private func setupMax() {
        maxLabel.snp.makeConstraints { (make) in
            if #available(iOS 11.0, *) {
                make.top.equalTo(self.safeAreaLayoutGuide).offset(40)
            } else {
                make.top.equalTo(self).offset(40)
            }
            make.left.right.lessThanOrEqualTo(self).inset(30)
            make.centerX.equalTo(self)
        }
    }
    
    private func setupAllocation() {
        allocationLabel.snp.makeConstraints { (make) in
            make.top.equalTo(maxLabel.snp.bottom).offset(20)
            make.left.right.lessThanOrEqualTo(self).inset(30)
            make.centerX.equalTo(self)
        }
    }
    
    private func setupNeed() {
        needLabel.snp.makeConstraints { (make) in
            make.top.equalTo(allocationLabel.snp.bottom).offset(20)
            make.left.right.lessThanOrEqualTo(self).inset(30)
            make.centerX.equalTo(self)
        }
    }
    
    private func setupAvailable() {
        availableLabel.snp.makeConstraints { (make) in
            make.top.equalTo(needLabel.snp.bottom).offset(20)
            make.left.right.lessThanOrEqualTo(self).inset(30)
            make.centerX.equalTo(self)
        }
    }
    
    private func setupSequence() {
        sequenceLabel.snp.makeConstraints { (make) in
            make.top.equalTo(availableLabel.snp.bottom).offset(20)
            make.left.right.lessThanOrEqualTo(self).inset(30)
            make.centerX.equalTo(self)
        }
    }

}
