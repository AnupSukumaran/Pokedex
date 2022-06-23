//
//  URLFormater.swift
//  Pokedex
//
//  Created by Sukumar Anup Sukumaran on 23/06/2022.
//

import Foundation


struct URLFormater {
    
    static let shared = URLFormater()
    private init() {}
    
    // create a URL from parameters
    func returnUrl(scheme:String = Constants.APIBase.scheme,host: String = Constants.APIBase.host, path: String = Constants.APIBase.path, _ parameters: JSON, withPathExtension: String? = nil) -> URL {
        
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
    
}
