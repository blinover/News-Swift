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
        return Array(realm.objects(Source.self).filter("isFavorite = true"))
    }
    
    func fetchCachedSources() -> [Source] {
        return Array(realm.objects(Source.self).filter("isCached = true"))
    }
    
    func updateCachedSource(_ sources: [Source]) {
        let cachedSources = fetchCachedSources()
        deleteObjects(cachedSources)
        
        for source in sources {
            source.isFavorite = false
            source.isCached = true
            add(source)
        }
    }
    
    func isSourceInFavorites(_ source: Source) -> (favorite: Bool, source: Source?) {
        let sources = realm.objects(Source.self).filter("id contains '\(source.id)' AND isFavorite = true")
        if sources.count > 0 {
            return (true, sources.first!)
        }
        return (false, nil)
    }
    
    func deleteObjects(_ objects: [Object]) {
        try! realm.write {
            for object in objects {
                realm.delete(object)
            }
        }
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
