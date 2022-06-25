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
                comp(.error(Constants.Txt.defaultErrorMsg))
               return
            }
            guard let data = response.data else { return }
            
            do {
                let modelResponse = try ModelResponse(data: data)
                comp(.success(modelResponse))
            } catch (let error) {
                comp(.error(error.localizedDescription))
            }
        }
    }
    
    func apiCallPokemonList(offset: Int, limit: Int,comp: @escaping ResultData ) {
        
        let params: JSON = ["offset": offset, "limit": limit] as JSON
        
        let urlReq = URL.getUrl(params, withPathExtension: Constants.PathExt.pokemon).getRequest()
        
        dataSetter(urlReq, comp: comp)
    }
    
    func apiCallPokemonDetail(urlStr: String?, comp: @escaping ResultData ) {
        
        guard let urlReq = URL(string: urlStr ?? "")?.getRequest() else {return}
        dataSetter(urlReq, comp: comp)
    }
    
}
