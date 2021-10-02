//
//  ResourceController.swift
//  banker-ios
//
//  Created by Lex on 3/4/19.
//  Copyright © 2019 Lex. All rights reserved.
//

import UIKit

class ResourceController: UIViewController, UITextFieldDelegate {
    
    private let alert = Alert()
    private let checkField = CheckField()
    
    var process: Int!
    var resource: Int!
    var resourceValues: [Int] = []
    
    var infoLabel: UILabel!
    var resourceValueTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupNavigationItems()
        resourceValueTextField.delegate = self
        showValue()
    }
    
    private func setupView() {
        let resourceView = ResourceView(frame: self.view.frame)
        infoLabel = resourceView.infoLabel
        resourceValueTextField = resourceView.resourceValueTextField
        self.view = resourceView
    }
        
    @IBAction func handleBack(_ sender: Any?) {
        self.dismiss(animated: true, completion: nil)
        self.view.endEditing(true)
    }
    
    private func showValue() {
        infoLabel.text = "We have \(resource!) resouces.\nPlease input each value with space"
    }
    
    @IBAction func handleNext(_ sender: Any?) {
        resourceValues.removeAll()
        if resourceValueTextField.text!.isEmpty {
            alert.showAlert(title: "Invalid", alert: "Please input the resource values", controller: self)
        } else {
            let value = resourceValueTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let valueArray = value.split(separator: " ")
            for i in valueArray {
                let check = checkField.checkNumber(input: String(i))
                if !check || valueArray.count != resource {
                    alert.showAlert(title: "Invalid", alert: "Your value is inncorrect", controller: self)
                    return
                }
                let toInt = Int(i)
                resourceValues.append(toInt!)
            }
            let maxMatrixController = MaxMatrixController()
            maxMatrixController.process = self.process
            maxMatrixController.resource = self.resource
            maxMatrixController.resourceValues = self.resourceValues
            let navController = UINavigationController(rootViewController: maxMatrixController)
            self.present(navController, animated: true, completion: nil)
        }
    }
}
