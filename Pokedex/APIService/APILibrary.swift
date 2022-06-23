//
//  APILibrary.swift
//  Pokedex
//
//  Created by Sukumar Anup Sukumaran on 23/06/2022.
//

import Foundation
import Alamofire

final class APILibrary {
    
    static let shared = APILibrary()
    private init(){}
    
    func dataSetter( _ req: URLRequest, comp: @escaping ResultData) {
        AF.request(req).validate().responseData { (response) in
            guard let statusCode = response.response?.statusCode,
                    statusCode >= 200 &&
                    statusCode <= 299 else {
                comp(.Error(Constants.Txt.defaultErrorMsg))
               return
            }
            guard let data = response.data else { return }
            do {
                let modelResponse = try ModelResponse(data: data)
                comp(.Success(modelResponse))
            } catch (let error) {
                comp(.Error(error.localizedDescription))
            }
        }
    }
    
    func apiCallPokemonList(comp: @escaping ResultData ) {
        
        
        
        let urlReq = URL.getUrl([:], withPathExtension: Constants.PathExt.pokemon).getRequest()
        
        dataSetter(urlReq, comp: comp)
    }
    
}
