//
//  Object.swift
//  News
//
//  Created by Danil Blinov on 20.05.2018.
//  Copyright © 2018 Blinov. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class Source: Object, Decodable {
    @objc dynamic var id: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var descript: String = ""
    @objc dynamic var url: String = ""
    @objc dynamic var category: String = ""
    @objc dynamic var language: String = ""
    @objc dynamic var country: String = ""
    
    @objc dynamic var isFavorite: Bool = false
    @objc dynamic var isCached: Bool = false

    private enum SourceCodingKeys: String, CodingKey {
        case id
        case name
        case descript = "description"
        case url
        case category
        case language
        case country
    }
    
    convenience init(id: String, name: String, descript: String, url: String, category: String, language: String, country: String) {
        self.init()
        self.id         = id
        self.name       = name
        self.descript   = descript
        self.url        = url
        self.category   = category
        self.language   = language
        self.country    = country
    }
    
    convenience required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: SourceCodingKeys.self)
        let id = try container.decode(String.self, forKey: .id)
        let name = try container.decode(String.self, forKey: .name)
        let descript = try container.decode(String.self, forKey: .descript)
        let url = try container.decode(String.self, forKey: .url)
        let category = try container.decode(String.self, forKey: .category)
        let language = try container.decode(String.self, forKey: .language)
        let country = try container.decode(String.self, forKey: .country)

        
        
        self.init(id: id, name: name, descript: descript, url: url, category: category, language: language, country: country)
    }
    
    convenience init(source: Source) {
        self.init()
        self.id         = source.id
        self.name       = source.name
        self.descript   = source.descript
        self.url        = source.url
        self.category   = source.category
        self.language   = source.language
        self.country    = source.country
    }
}
