//
//  MainController.swift
//  banker-ios
//
//  Created by Lex on 2/4/19.
//  Copyright © 2019 Lex. All rights reserved.
//

import UIKit

class MainController: UIViewController, UITextFieldDelegate {
    
    private let alert = Alert()
    var processTextField: UITextField!
    var resourceTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupNavigationItems()
        processTextField.delegate = self
        resourceTextField.delegate = self
    }
    
    private func setupView() {
        let mainView = MainView(frame: self.view.frame)
        self.processTextField = mainView.processTextField
        self.resourceTextField = mainView.resourceTextField
        self.view = mainView
    }
    
    @IBAction func handleNext(_ sender: Any?) {
        if processTextField.text!.isEmpty || resourceTextField.text!.isEmpty {
            alert.showAlert(title: "Invalid", alert: "Process number and Resource number must not be empty", controller: self)
        } else {
            let resourceController = ResourceController()
            resourceController.process = Int(self.processTextField.text!)
            resourceController.resource = Int(self.resourceTextField.text!)
            let navController = UINavigationController(rootViewController: resourceController)
            self.present(navController, animated: true, completion: nil)
        }
    }
}
