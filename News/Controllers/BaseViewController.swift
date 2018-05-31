//
//  BaseViewController.swift
//  News
//
//  Created by Danil Blinov on 27.05.2018.
//  Copyright © 2018 Blinov. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
    }

    func setupViewController() {
        
    }
    
    func showAlert(title: String, subtitle: String, confirmation: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: subtitle, preferredStyle: .alert)
        
        let confirmAction = UIAlertAction(title: "OK", style: .default) { (action) in
            if let closure = confirmation {
                closure()
            }
        }
        
        alertController.addAction(confirmAction)
        present(alertController, animated: true, completion: nil)
    }
    
    func showConfirmationAlert(with title: String, subtitle: String, confirmation: (() -> Void)? = nil, cancelation: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: subtitle, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        { (action) in
            if let closure = cancelation {
                closure()
            }
        }
        let confirmAction = UIAlertAction(title: "OK", style: .default) { (action) in
            if let closure = confirmation {
                closure()
            }
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(confirmAction)
        present(alertController, animated: true, completion: nil)
    }

}
