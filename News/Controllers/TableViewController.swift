//
//  TableViewController.swift
//  News
//
//  Created by Danil Blinov on 27.05.2018.
//  Copyright © 2018 Blinov. All rights reserved.
//

import UIKit

class TableViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    var tableViewStructureDelegates: TableViewStructureDelegates!
    
    
    override func setupViewController() {
        super.setupViewController()
        automaticallyAdjustsScrollViewInsets = false
        tableViewStructureDelegates = TableViewStructureDelegates(tableView: tableView)
        createStructure()
    }
    
    func createStructure() {
        
    }
}
