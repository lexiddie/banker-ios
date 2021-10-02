//
//  NeedMatrixController.swift
//  banker-ios
//
//  Created by Lex on 3/4/19.
//  Copyright © 2019 Lex. All rights reserved.
//

import UIKit

class NeedMatrixController: UIViewController {

    var allocationValues = [Int]()
    var resourceValues = [Int]()
    var maxString: String = ""
    var maxMatrixValues = [[Int]]()
    var allocationString: String = ""
    var allocationMatrixValues = [[Int]]()
    var needString: String = ""
    var needMatrixValues = [[Int]]()
    var availableString: String = ""
    var availableMatrixValues = [[Int]]()
    
    var process: Int!
    var resultIndex = [Int]()
    var isDeadLocked = false
    
    var maxLabel: UILabel!
    var allocationLabel: UILabel!
    var needLabel: UILabel!
    var availableLabel: UILabel!
    var sequenceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupNavigationItems()
        setupNeedMatrix()
        setupAvailableMatrix()
        setupAvailableResource()
        setupValue()
    }
    
    private func setupView() {
        let needMatrixView = NeedMatrixView(frame: self.view.frame)
        maxLabel = needMatrixView.maxLabel
        allocationLabel = needMatrixView.allocationLabel
        needLabel = needMatrixView.needLabel
        availableLabel = needMatrixView.availableLabel
        sequenceLabel = needMatrixView.sequenceLabel
        self.view = needMatrixView
    }
    
    private func setupValue() {
        maxLabel.text = "Max Matrix Values\n\(maxString)"
        allocationLabel.text = "Allocation Matrix Values\n\(allocationString)"
        needLabel.text = "Need Matrix Values\n\(needString)"
        availableLabel.text = "Available Resource Vector\n\(availableString)"
        if !isDeadLocked {
            setupSequence()
        } else {
            sequenceLabel.text = "The system is not in a safe state. It has Deadlock."
        }
    }
    
    private func setupSequence() {
        var result = "<"
        for i in 0...resultIndex.count - 1 {
            result += "P\(resultIndex[i])"
            if i != resultIndex.count - 1 {
                result += ", "
            } else {
                result += ">"
            }
        }
        sequenceLabel.text = "The system is in a safe state since the sequence\n\(result)"
    }
    
    @IBAction func handleBack(_ sender: Any?) {
        self.dismiss(animated: true, completion: nil)
        self.view.endEditing(true)
    }
    
    private func setupNeedMatrix() {
        for i in 0...maxMatrixValues.count - 1 {
            var row = [Int]()
            for j in 0...maxMatrixValues[i].count - 1 {
                let currentNeedValue = maxMatrixValues[i][j] - allocationMatrixValues[i][j]
                row.append(currentNeedValue)
                needString += "\(currentNeedValue) "
            }
            needString += "\n"
            needMatrixValues.insert(row, at: i)
        }
    }
    
    private func setupAvailableMatrix() {
        for i in 0...allocationMatrixValues.count - 1 {
            for j in 0...allocationMatrixValues[i].count - 1 {
                if i == 0 {
                    allocationValues.insert(allocationMatrixValues[i][j], at: j)
                } else {
                    allocationValues[j] = allocationValues[j] + allocationMatrixValues[i][j]
                }
            }
        }
        var row = [Int]()
        for i in 0...resourceValues.count - 1 {
            let value = String(resourceValues[i] - allocationValues[i])
            availableString += "\(value) "
            row.append(Int(value)!)
        }
        availableMatrixValues.append(row)
    }
    
    private func setupAvailableResource() {
        var checkProcess = true
        var countCycle = 0
        while checkProcess {
            countCycle += 1
            for i in 0...needMatrixValues.count - 1 {
                let check = checkFinishedIndex(index: i)
                var checkValid = 0
                for x in 0...availableMatrixValues.count - 1 {
                    for y in 0...availableMatrixValues[x].count  - 1 {
                        if availableMatrixValues[x][y] >= needMatrixValues[i][y] {
                            checkValid += 1
                        }
                    }
                }
                if checkValid == needMatrixValues[i].count && check {
                    resultIndex.append(i)
                    updateAvailableResource(finishedIndex: i)
                }
            }
            if process == resultIndex.count {
                checkProcess = false
            } else if countCycle == 10 {
                checkProcess = false
                isDeadLocked = true
            }
        }
    }
    
    private func updateAvailableResource(finishedIndex: Int) {
        for i in 0...allocationMatrixValues[finishedIndex].count - 1 {
            availableMatrixValues[0][i] += allocationMatrixValues[finishedIndex][i]
        }
    }
    
    private func checkFinishedIndex(index: Int) -> Bool {
        if !resultIndex.isEmpty {
            for i in resultIndex {
                if index == i {
                    return false
                }
            }
        }
        return true
    }
}
