//
//  CheckField.swift
//  banker-ios
//
//  Created by Lex on 3/4/19.
//  Copyright © 2019 Lex. All rights reserved.
//

import UIKit

class CheckField: NSObject {
    
    func checkNumber(input: String) -> Bool {
        let toCharArray = input.unicodeScalars
        var count = 0
        for i in toCharArray {
            let value = i.value
            if value >= 48 && value <= 57 {
                count += 1
            }
        }
        if count == toCharArray.count {
            return true
        }
        return false
    }
}
