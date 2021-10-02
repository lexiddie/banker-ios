//
//  MaxMatrixController.swift
//  banker-ios
//
//  Created by Lex on 3/4/19.
//  Copyright © 2019 Lex. All rights reserved.
//

import UIKit

class MaxMatrixController: UIViewController, UITextViewDelegate {

    private let alert = Alert()
    private let checkField = CheckField()
    private let checkMatrix = CheckMaxtrix()
    
    var process: Int!
    var resource: Int!
    var resourceValues = [Int]()
    var maxMatrixValues = [[Int]]()
    
    var infoLabel: UILabel!
    var exampleLabel: UILabel!
    var maxMatrixTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupNavigationItems()
        showValue()
        maxMatrixTextView.delegate = self
    }
    
    private func setupView() {
        let maxMatrixView = MaxMatrixView(frame: self.view.frame)
        infoLabel = maxMatrixView.infoLabel
        exampleLabel = maxMatrixView.exampleLabel
        maxMatrixTextView = maxMatrixView.maxMatrixTextView
        self.view = maxMatrixView
    }
    
    private func showValue() {
        var showResources = ""
        var showProcesses = ""
        for i in 0...(resourceValues.count - 1) {
            showResources += "R\(i)=\(resourceValues[i]) "
        }
        for i in 0...(process - 1) {
            showProcesses += "P\(i) "
        }
        infoLabel.text = "We have \(resource!) resouces.\nThere are \(showResources)\nAnd \(process!) processes\nThere are \(showProcesses)"
        exampleLabel.text = "Example with 3 Resources & 4 Processes\n\n3 2 2\n6 1 3\n3 1 4\n 4 2 2"
        maxMatrixTextView.text = "5 1 1 1\n2 1 2 2\n5 1 2 2\n11 1 2 2\n1 1 3 1"
    }
    
    @IBAction func handleBack(_ sender: Any?) {
        self.dismiss(animated: true, completion: nil)
        self.view.endEditing(true)
    }
    
    @IBAction func handleRandom(_ sender: Any?) {
        var resourceString = ""
        for _ in 0...process - 1 {
            for j in 0...resource - 1 {
                resourceString += String(Int.random(in: 0...resourceValues[j]))
                resourceString += " "
            }
            resourceString += "\n"
        }
        maxMatrixTextView.text = resourceString
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
    
    @IBAction func handleNext(_ sender: Any?) {
        maxMatrixValues.removeAll()
        if maxMatrixTextView.text!.isEmpty {
            alert.showAlert(title: "Invalid", alert: "Your input matrix is invalid, please check it again", controller: self)
            return
        } else {
            let matrixValue = maxMatrixTextView.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let matrixArray = matrixValue.split(separator: "\n")
            let check = checkMatrix.checkMax(processes: process, resourceValues: resourceValues, matrixArray: matrixArray)
            if !check {
                alert.showAlert(title: "Invalid", alert: "Your input matrix is invalid, please check it again", controller: self)
                return
            } else {
                for i in 0...(process - 1) {
                    var row = [Int]()
                    for j in 0...(resource - 1) {
                        let matrixArraySplit = matrixArray[i].split(separator: " ")
                        row.append((matrixArraySplit[j] as NSString).integerValue)
                    }
                    maxMatrixValues.insert(row, at: i)
                }
                let allocationMatrixController = AllocationMatrixController()
                allocationMatrixController.process = self.process
                allocationMatrixController.resource = self.resource
                allocationMatrixController.resourceValues = self.resourceValues
                allocationMatrixController.maxMatrixValues = self.maxMatrixValues
                allocationMatrixController.maxValue = matrixValue
                let navController = UINavigationController(rootViewController: allocationMatrixController)
                self.present(navController, animated: true, completion: nil)
            }
        }
    }
}
