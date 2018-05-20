//
//  ViewController.swift
//  News
//
//  Created by Danil Blinov on 20.05.2018.
//  Copyright © 2018 Blinov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkingManager.shared.getSources { (result) in
            switch result {
            case .success(let sources):
                print(sources)
            case .failure(let error):
                print(error)
            }
        }
    }
    
}

