//
//  Constants.swift
//  News
//
//  Created by Danil Blinov on 20.05.2018.
//  Copyright © 2018 Blinov. All rights reserved.
//

import Foundation

struct Constatns {
    
    struct Network {
        
        static let baseUrl = "https://newsapi.org/v2"
        static let apiKey = "e3b1d070e25e41d3b4f866a245c43257"
        
        static let sources = "/sources"
        static let everything = "/everything"
        
        //Keypaths
        static let sourcesKeyPath = "sources"
        static let articlesKeyPath = "articles"
        
        static let sourcesParam = "sources"
        static let searchParam = "q"
        
        static let apiKeyHeader = "x-api-key"
        
        static let messageKey = "message"
    }
    
    struct Controllers {
        static let NewsFeedViewController = "NewsFeedViewController"
    }
    
    struct Storyboards {
        static let Main = "Main"
    }
}
