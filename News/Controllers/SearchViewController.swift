//
//  SearchViewController.swift
//  News
//
//  Created by Danil Blinov on 30.05.2018.
//  Copyright © 2018 Blinov. All rights reserved.
//

import UIKit

private let searchMinBuffer = 1

class SearchViewController: TableViewController {
    
    private var currentCode = 0
    private var searchCounter = 0
    private var isSerching = false
    private var articles = [Article]()
    
    override func setupViewController() {
        super.setupViewController()
        
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
    
    private func search(string: String) {
        searchCounter += 1
        NetworkService.searchArticles(search: string,
                                      searchCode: searchCounter)
        { [unowned self] (result, code) in
            switch result {
            case .success(let articles):
                if self.currentCode < code && self.isSerching {
                    self.currentCode = code
                    self.articles = articles
                    self.createStructure()
                }
            case .failure(let error):
                self.showAlert(title: "ERROR", subtitle: error.localizedDescription, confirmation: nil)
            }
        }
    }
    
}

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count >= searchMinBuffer {
            isSerching = true
            search(string: searchText)
        } else {
            isSerching = false
            articles = []
            createStructure()
        }
    }
}
