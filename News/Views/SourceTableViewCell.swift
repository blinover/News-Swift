//
//  SourceTableViewCell.swift
//  News
//
//  Created by Danil Blinov on 20.05.2018.
//  Copyright © 2018 Blinov. All rights reserved.
//

import UIKit
import FaveButton

class SourceTableViewCell: BaseTableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var favoriteButton: FaveButton!
    var model: SourceCellModel?

    override func configureCell(cellModel: BaseCellModel) {
        super.configureCell(cellModel: cellModel)
        self.selectionStyle = .none
        guard let model = cellModel as? SourceCellModel else { return }
        self.model = model
        self.titleLabel.text = model.title
        self.subtitleLabel.text = model.subtitle
        self.favoriteButton.isSelected = model.isFavorite
    }
    
    @IBAction func favoriteButtonPressed(_ sender: FaveButton) {
        guard let model = self.model else { return }
        if let closure = model.onClickFavorite {
            closure(model ,model.source)
        }
    }
}
