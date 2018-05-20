//
//  NetworkingManager.swift
//  News
//
//  Created by Danil Blinov on 20.05.2018.
//  Copyright © 2018 Blinov. All rights reserved.
//

import Foundation
import Alamofire
import CodableAlamofire

struct NetworkingManager {
   
    static let shared = NetworkingManager()
    private let manager: SessionManager!
    private let decoder = JSONDecoder()
    
    func getSources(complition: @escaping (Result<[Source]>)->Void) {
        let endpoint = Endpoint.getSources()
        
        manager.request(endpoint.url,
                          method: endpoint.methodd,
                          encoding:  JSONEncoding.default)
            .responseDecodableObject(queue: nil,
                                     keyPath: Constatns.Network.sourcesKeyPath,
                                     decoder: decoder)
            { (response: DataResponse<[Source]>) in
                complition(response.result)
        }
    }
    
    private init() {
        let configuration = URLSessionConfiguration.default
        var defaultHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        defaultHeaders["x-api-key"] = Constatns.Network.apiKey
        configuration.httpAdditionalHeaders = defaultHeaders
        self.manager = SessionManager(configuration: configuration)
    }
}
