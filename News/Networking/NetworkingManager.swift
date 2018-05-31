//
//  NetworkingManager.swift
//  News
//
//  Created by Danil Blinov on 20.05.2018.
//  Copyright © 2018 Blinov. All rights reserved.
//

import Foundation
import Alamofire

struct NetworkingManager {
    
    static func performRequest<T: Decodable>(endpoint: Endpoint, parametrs: [String: Any]? = nil, keyPath: String, complition: @escaping (Result<T>)->Void) {
        let decoder = JSONDecoder()
        let headers: HTTPHeaders = [Constatns.Network.apiKeyHeader : Constatns.Network.apiKey]
        Alamofire.request(endpoint.url,
                          method: endpoint.methodd,
                          parameters: parametrs,
                          encoding: JSONEncoding.default,
                          headers: headers)
            .responseDecodableObject(queue: nil,
                                     keyPath: keyPath,
                                     decoder: decoder)
            { (response: DataResponse<T>) in
                if response.result.isSuccess {
                    complition(response.result)
                }
            }.responseJSON { (response) in
                switch response.result {
                case .success(let json):
                    if let dict = json as? [String: Any]{                    if let message = dict[Constatns.Network.messageKey] as? String {
                        let error = NSError(domain:"", code:response.response?.statusCode ?? 999 , userInfo:[NSLocalizedDescriptionKey: message])
                        complition(Result.failure(error))
                        }
                    }
                case .failure(let error):
                    complition(Result.failure(error))
                }
        }
    }
    
}
