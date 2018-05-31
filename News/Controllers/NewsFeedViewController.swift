//
//  NewsFeedViewController.swift
//  News
//
//  Created by Danil Blinov on 28.05.2018.
//  Copyright © 2018 Blinov. All rights reserved.
//

import UIKit
import SVProgressHUD

class NewsFeedViewController: TableViewController {
    
    var sourcesIDs: [String]!
    
    private var articles = [Article]()
    
    override func setupViewController() {
        super.setupViewController()
        loadData()
    }
    
    override func createStructure() {
        super.createStructure()
        
        var articlesModels = [ArticleCellModel]()
        
        for article in articles {
            let articleModel = ArticleCellModel(article: article)
            articlesModels.append(articleModel)
        }

        tableViewStructureDelegates.sectionsRowsArray = [articlesModels]
        tableView.reloadData()
    }
    
    private func loadData() {
        SVProgressHUD.show()
        NetworkService.getChannelNews(with: sourcesIDs) { [unowned self] (result) in
            SVProgressHUD.dismiss()
            switch result {
            case .success(let articles):
                self.articles = articles
                self.createStructure()
            case .failure(let error):
                self.showAlert(title: "ERROR", subtitle: error.localizedDescription, confirmation: nil)
            }
        }
    }
}
