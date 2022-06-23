//
//  HomeViewModel.swift
//  Pokedex
//
//  Created by Sukumar Anup Sukumaran on 23/06/2022.
//

import UIKit

protocol HomeViewModelProtocol: UITableViewDelegate, UITableViewDataSource  {
    var results: [PokResult] {get set}
    var tableReload: (() -> Void)? {get set}
    func callAPI(offset: Int, limit: Int)
}

class HomeViewModel:NSObject, HomeViewModelProtocol {
    var results: [PokResult] = []
    var tableReload: (() -> Void)?
}

extension HomeViewModel {
    
    func callAPI(offset: Int, limit: Int) {
        APILibrary.shared.apiCallPokemonList(offset: offset, limit: limit) { response in
            switch response {
            case .Success(let data):
                let pageCnt = data.pokemonAPIData?.count ?? 0
                self.results = data.pokemonAPIData?.results ?? []
                self.tableReload?()
                
            case .Error(let error):
                print("Error = \(error)")
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as? HomeTableViewCell else {
            fatalError("NO CELL CLASS FOUND")
        }
        
        cell.config(results[indexPath.row])
        
        return cell
    }
}
