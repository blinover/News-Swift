//
//  Endpoint.swift
//  News
//
//  Created by Danil Blinov on 20.05.2018.
//  Copyright © 2018 Blinov. All rights reserved.
//

import Foundation
import Alamofire

struct Endpoint {
    var methodd: HTTPMethod
    var url: URL
    
    static func getSources() -> Endpoint {
        let urlString = Constatns.Network.baseUrl + Constatns.Network.sources
        return Endpoint(urlString: urlString, method: .get)
    }
    
    static func getSourcesNews(sources: [String]) -> Endpoint {
        let sourcesString = sources.joined(separator: ",")
        let urlString = Constatns.Network.baseUrl + Constatns.Network.everything + "?" + Constatns.Network.sourcesParam + "=" + sourcesString
        return Endpoint(urlString: urlString, method: .get)
    }
    
    static func searchArticle(search: String) -> Endpoint {
        let urlString = Constatns.Network.baseUrl + Constatns.Network.everything + "?" + Constatns.Network.searchParam + "=" + search
        return Endpoint(urlString: urlString, method: .get)
    }
    
    private init(urlString: String, method: HTTPMethod) {
        self.url = try! urlString.asURL()
        self.methodd = method
    }
}
