//
//  CheckMaxtrix.swift
//  banker-ios
//
//  Created by Lex on 3/4/19.
//  Copyright © 2019 Lex. All rights reserved.
//

import UIKit

class CheckMaxtrix: NSObject {
    
    let checkField = CheckField()
    
    func checkMax(processes: Int, resourceValues: [Int], matrixArray: [Substring]) -> Bool {
        for i in 0...matrixArray.count - 1 {
            let matrixArraySplit = matrixArray[i].split(separator: " ")
            if resourceValues.count != matrixArraySplit.count || processes != matrixArray.count {
                return false
            }
            for j in 0...matrixArraySplit.count - 1 {
                let check = checkField.checkNumber(input: String(matrixArraySplit[j]))
                if !check || Int(matrixArraySplit[j])! > resourceValues[j]{
                    return false
                }
            }
        }
        return true
    }
    
    func checkAllocation(processes: Int, resourceValues: [Int], maxMatrixValues: [[Int]], allocationArray: [Substring]) -> Bool {
        var allocationValues = [Int]()
        for  i in 0...allocationArray.count - 1 {
            let allocationArraySplit = allocationArray[i].split(separator: " ")
            if resourceValues.count != allocationArraySplit.count || processes != allocationArray.count {
                return false
            }
            for j in 0...allocationArraySplit.count - 1 {
                
                let check = checkField.checkNumber(input: String(allocationArraySplit[j]))
                if !check || maxMatrixValues[i][j] < Int(allocationArraySplit[j])! {
                    print("Check \(maxMatrixValues[i][j]) && \(Int(allocationArraySplit[j])!)")
                    return false
                } else if i == 0 {
                    allocationValues.insert(Int(allocationArraySplit[j])!, at: j)
                } else if i > 0 {
                    
                }
            }
        }
        for k in 0...allocationValues.count - 1 {
            if allocationValues[k] > resourceValues[k] {
                return false
            }
        }
        return true
    }
}
