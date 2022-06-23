//
//  ViewController.swift
//  Pokedex
//
//  Created by Sukumar Anup Sukumaran on 23/06/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        callAPI()
    }


    func callAPI() {
        
        APILibrary.shared.apiCallPokemonList { response in
            switch response {
            case .Success(let data):
                
                let results = data.pokemonAPIData?.results ?? []
                
                print("results = \(results.first?.name ?? "None")")
                
            case .Error(let error):
                
                break
            }
        }
        
    }
    
}

