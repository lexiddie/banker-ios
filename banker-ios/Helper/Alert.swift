//
//  Alert.swift
//  banker-ios
//
//  Created by Lex on 3/4/19.
//  Copyright © 2019 Lex. All rights reserved.
//

import UIKit

class Alert: NSObject {
    
    func showAlert(title: String, alert: String, controller: UIViewController){
        let alertControl = UIAlertController(title: title, message: alert, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default) { (action) in
            alertControl.dismiss(animated: true, completion: nil)
        }
        alertControl.addAction(alertAction)
        controller.present(alertControl, animated: true, completion: nil)
    }
}
