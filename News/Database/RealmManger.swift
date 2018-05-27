//
//  RealmManger.swift
//  News
//
//  Created by Danil Blinov on 27.05.2018.
//  Copyright © 2018 Blinov. All rights reserved.
//

import Foundation
import Realm
import RealmSwift


struct RealmManager {
    static let shared = RealmManager()
    private let realm = try! Realm()

    
    func fetchFavoriteSources() -> [Source] {
        return Array(realm.objects(Source.self))
    }
    
    func isSourceInFavorites(_ source: Source) -> Bool {
        let sources = realm.objects(Source.self).filter("id contains '\(source.id)'")
        if sources.count > 0 {
            return true
        }
        return false
    }
    
    
    
    func delete(_ object: Object) {
        try! realm.write {
            realm.delete(object)
        }
    }
    
    func add(_ object: Object) {
        try! realm.write {
            realm.add(object)
        }
    }
    
}
