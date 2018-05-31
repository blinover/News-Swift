//
//  NetworkService.swift
//  News
//
//  Created by Danil Blinov on 29.05.2018.
//  Copyright © 2018 Blinov. All rights reserved.
//

import Foundation
import Alamofire
import CodableAlamofire

struct NetworkService {
    
    static func getSources(complition: @escaping (Result<[Source]>)->Void) {
        let endpoint = Endpoint.getSources()
        NetworkingManager.performRequest(endpoint: endpoint, keyPath: Constatns.Network.sourcesKeyPath) { (result: Result<[Source]>) in
            complition(result)
        }
    }
    
    static func getChannelNews(with sources: [String], complition: @escaping (Result<[Article]>)->Void) {
        let endpoint = Endpoint.getSourcesNews(sources: sources)
        
        NetworkingManager.performRequest(endpoint: endpoint, keyPath: Constatns.Network.articlesKeyPath) { (result: Result<[Article]>) in
            complition(result)
        }
    }
    
    static func searchArticles(search: String, searchCode:Int, complition: @escaping (Result<[Article]>, Int)->Void) {
        let endpoint = Endpoint.searchArticle(search: search)
        
        NetworkingManager.performRequest(endpoint: endpoint, keyPath: Constatns.Network.articlesKeyPath) { (result: Result<[Article]>) in
            complition(result,searchCode)
        }
    }
    
}
