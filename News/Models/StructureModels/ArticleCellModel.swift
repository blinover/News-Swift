//
//  ArticleCellModel.swift
//  News
//
//  Created by Danil Blinov on 29.05.2018.
//  Copyright © 2018 Blinov. All rights reserved.
//

import UIKit

class ArticleCellModel: BaseCellModel {
    var title: String!
    var subtitle: String!
    var imageUrl: URL?
    
    init(article: Article) {
        super.init()
        self.cellIdentifier = ArticleTableViewCell.cellIdentifier()
        self.title = article.title
        self.subtitle = article.descript
        self.imageUrl = URL(string: article.image)
    }
}
