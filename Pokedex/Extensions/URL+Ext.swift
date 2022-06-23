//
//  URL+Ext.swift
//  Pokedex
//
//  Created by Sukumar Anup Sukumaran on 23/06/2022.
//

import Foundation

extension URL {

    static func getUrl(scheme:String = Constants.APIBase.scheme,host: String = Constants.APIBase.host, path: String = Constants.APIBase.path, _ parameters: JSON, withPathExtension: String? = nil) -> Self {
        
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path + (withPathExtension ?? "")
        components.queryItems = [URLQueryItem]()
        
        for (key, value) in parameters {
            let queryItem = URLQueryItem(name: key, value: "\(value)")
            components.queryItems!.append(queryItem)
        }
        
        guard let url = components.url else {fatalError("URL Not valid")}
        
        return url
    }
    
    func getRequest() -> URLRequest {
        
        var req = URLRequest(url: self)
        req.httpMethod = "GET"
        req.timeoutInterval = 60
        return req
    }
    
}

