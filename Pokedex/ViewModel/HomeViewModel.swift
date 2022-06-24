//
//  HomeViewModel.swift
//  Pokedex
//
//  Created by Sukumar Anup Sukumaran on 23/06/2022.
//

import UIKit

protocol HomeViewModelProtocol: UITableViewDelegate, UITableViewDataSource  {
    var results: [PokResult] {get set}
    var offsetCnt: Int {get set}
    var limitCnt: Int {get set}
    var totalPgCnt: Int {get set}
    var tableReload: ((String) -> Void)? {get set}
    func callingPokemonAPI(addedOffsetVal: Int , isAdded: Bool)
    func getLastPage()
    func callAPI(offset: Int, limit: Int)
}

class HomeViewModel:NSObject, HomeViewModelProtocol {
    var results: [PokResult] = []
    var offsetCnt: Int = 0
    var limitCnt: Int = 20
    var totalPgCnt: Int = 0
    var tableReload: ((String) -> Void)?
}

extension HomeViewModel {
    
    func callingPokemonAPI(addedOffsetVal: Int = 0, isAdded: Bool = true) {
        
        isAdded ?
        (self.offsetCnt += addedOffsetVal) :
        (self.offsetCnt -= addedOffsetVal)
        
       
        callAPI(offset: self.offsetCnt, limit: limitCnt)
    }
    
    func getLastPage() {
        offsetCnt = totalPgCnt - limitCnt
        callAPI(offset: offsetCnt, limit: limitCnt)
    }
    
    func callAPI(offset: Int = 0, limit: Int = 20) {
        APILibrary.shared.apiCallPokemonList(offset: offset, limit: limit) { response in
            switch response {
            case .Success(let data):
                self.totalPgCnt = data.pokemonAPIData?.count ?? 0
                self.results = data.pokemonAPIData?.results ?? []
                self.tableReload?(String(self.totalPgCnt))
                
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
