//
//  ArticleTableViewCell.swift
//  News
//
//  Created by Danil Blinov on 29.05.2018.
//  Copyright © 2018 Blinov. All rights reserved.
//

import UIKit
import SDWebImage

private let navigationBarHeight:CGFloat = 84.0

class ArticleTableViewCell: BaseTableViewCell {
    @IBOutlet weak var articleImageHeight: NSLayoutConstraint!
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    override func configureCell(cellModel: BaseCellModel) {
        super.configureCell(cellModel: cellModel)
        self.selectionStyle = .none
        guard let model = cellModel as? ArticleCellModel else { return }
        self.titleLabel.text = model.title
        self.subtitleLabel.text = model.subtitle
        self.articleImageView.sd_setImage(with: model.imageUrl) { (image, error, tupe, url) in
            if error != nil {
                self.articleImageView.image = #imageLiteral(resourceName: "no_image")
            }
        }
        self.articleImageHeight.constant = (UIScreen.main.bounds.height - navigationBarHeight) / 2
    }
    
}
