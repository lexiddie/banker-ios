//
//  AllocationMatrixController.swift
//  banker-ios
//
//  Created by Lex on 3/4/19.
//  Copyright © 2019 Lex. All rights reserved.
//

import UIKit

class AllocationMatrixController: UIViewController, UITextViewDelegate {
    
    private let alert = Alert()
    private let checkField = CheckField()
    private let checkMatrix = CheckMaxtrix()

    var process: Int!
    var resource: Int!
    var resourceValues = [Int]()
    var maxValue: String!
    var maxMatrixValues = [[Int]]()
    var allocationMatrixValues = [[Int]]()
    
    var infoLabel: UILabel!
    var maxLabel: UILabel!
    var maxMatrixLabel: UILabel!
    var allocationMatrixTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupNavigationItems()
        showValue()
        allocationMatrixTextView.delegate = self
    }
    
    private func setupView() {
        let allocationMatrixView = AllocationMatrixView(frame: self.view.frame)
        infoLabel = allocationMatrixView.infoLabel
        maxLabel = allocationMatrixView.maxLabel
        maxMatrixLabel = allocationMatrixView.maxMatrixLabel
        allocationMatrixTextView = allocationMatrixView.allocationTextView
        self.view = allocationMatrixView
    }
    
    private func showValue() {
        infoLabel.text = "We have \(resource!) resouces and \(process!) processes."
        maxLabel.text = "Each Allocation Matrix value must not be greater than its Max Matrix Column and Row"
        maxMatrixLabel.text = "Max Matrix Values\n\(maxValue!)"
        allocationMatrixTextView.text = "1 0 0 0\n0 0 0 0\n1 0 0 0\n9 0 0 0\n0 0 1 0"
    }
    
    func textViewDidChange(_ textView: UITextView) {
        let size = CGSize(width: self.view.frame.width, height: .infinity)
        let estimatedSize = textView.sizeThatFits(size)
        textView.constraints.forEach { (contraint) in
            if contraint.firstAttribute == .height {
                contraint.constant = estimatedSize.height
            }
        }
    }
    
    @IBAction func handleBack(_ sender: Any?) {
        self.dismiss(animated: true, completion: nil)
        self.view.endEditing(true)
    }
    
    @IBAction func handleRandom(_ sender: Any?) {
        checkRandom()
    }
    
    private func checkRandom() {
        var totalRow = [Int]()
        var checkLoop = true
        while checkLoop {
            totalRow.removeAll()
            let allocationString = allocationRandom()
            let allocationArray = allocationString.split(separator: "\n")
            for i in 0...process - 1 {
                for j in 0...resource - 1 {
                    let allocationSplit = allocationArray[i].split(separator: " ")
                    if i == 0 {
                        totalRow.insert((allocationSplit[j] as NSString).integerValue, at: j)
                    } else {
                        totalRow[j] = totalRow[j] + (allocationSplit[j] as NSString).integerValue
                    }
                }
            }
            var countLoop = 0
            for i in 0...totalRow.count - 1 {
                if totalRow[i] > resourceValues[i] {
                    countLoop += 1
                } else if countLoop == 0 && i == totalRow.count - 1 {
                    checkLoop = false
                    allocationMatrixTextView.text = allocationString
                }
            }
        }
    }
    
    private func allocationRandom() -> String {
        var allocationString = ""
        for i in 0...process - 1 {
            for j in 0...resource - 1 {
                allocationString += String(Int.random(in: 0...maxMatrixValues[i][j]))
                allocationString += " "
            }
            allocationString += "\n"
        }
        return allocationString
    }
    
    @IBAction func handleNext(_ sender: Any?) {
        allocationMatrixValues.removeAll()
        if allocationMatrixTextView.text!.isEmpty {
            alert.showAlert(title: "Invalid", alert: "Your input matrix is invalid, please check it again", controller: self)
            return
        } else {
            let allocationValue = allocationMatrixTextView.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let allocationArray = allocationValue.split(separator: "\n")
            let check = checkMatrix.checkAllocation(processes: process, resourceValues: resourceValues, maxMatrixValues: maxMatrixValues, allocationArray: allocationArray)
            if !check {
                alert.showAlert(title: "Invalid", alert: "Your input matrix is invalid, please check it again", controller: self)
                return
            } else {
                for i in 0...(process - 1) {
                    var row = [Int]()
                    for j in 0...(resource - 1) {
                        let allocationArraySplit = allocationArray[i].split(separator: " ")
                        row.append((allocationArraySplit[j] as NSString).integerValue)
                    }
                    allocationMatrixValues.insert(row, at: i)
                }
                let needMatrixController = NeedMatrixController()
                needMatrixController.resourceValues = self.resourceValues
                needMatrixController.maxString = self.maxValue
                needMatrixController.allocationString = allocationValue
                needMatrixController.maxMatrixValues = self.maxMatrixValues
                needMatrixController.allocationMatrixValues = self.allocationMatrixValues
                needMatrixController.process = self.process
                let navController = UINavigationController(rootViewController: needMatrixController)
                self.present(navController, animated: true, completion: nil)
            }
        }
    }
    

}
