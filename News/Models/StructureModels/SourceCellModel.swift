//
//  SourceCellModel.swift
//  News
//
//  Created by Danil Blinov on 20.05.2018.
//  Copyright © 2018 Blinov. All rights reserved.
//

import Foundation
typealias OnClickFavoriteButton = (_ model: SourceCellModel,_ source: Source) -> Void

class SourceCellModel: BaseCellModel {
    
    var source: Source!
    var title: String!
    var subtitle: String!
    var isFavorite: Bool!
    var onClickFavorite: OnClickFavoriteButton!
    
    init(source: Source) {
        super.init()
        self.cellIdentifier = SourceTableViewCell.cellIdentifier()
        self.source = source
        self.title = source.name
        self.subtitle = source.descript
        self.isFavorite = RealmManager.shared.isSourceInFavorites(source).favorite
    }

}

