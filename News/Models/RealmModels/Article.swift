//
//  Article.swift
//  News
//
//  Created by Danil Blinov on 29.05.2018.
//  Copyright © 2018 Blinov. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

class Article: Object, Decodable {
    @objc dynamic var title: String = ""
    @objc dynamic var descript: String = ""
    @objc dynamic var image: String = ""

    private enum ArticleCodingKeys: String, CodingKey {
        case title
        case descript = "description"
        case image = "urlToImage"
    }
    
    convenience init(title: String, descript: String, image: String) {
        self.init()
        self.title      = title
        self.descript   = descript
        self.image      = image
    }
    
    convenience required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ArticleCodingKeys.self)
        let title = try container.decode(String.self, forKey: .title)
        let descript = try container.decode(String.self, forKey: .descript)
        let urlString: String
        if let url = try container.decodeIfPresent(String.self, forKey: .image) {
            urlString = url
        } else {
            urlString = ""
        }
        
        self.init(title: title, descript: descript, image: urlString)
    }
}
