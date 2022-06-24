//
//  HomeViewModel.swift
//  Pokedex
//
//  Created by Sukumar Anup Sukumaran on 23/06/2022.
//

import UIKit

protocol HomeViewModelProtocol: UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating, UISearchBarDelegate {
    var results: [PokResult] {get set}
    var offsetCnt: Int {get set}
    var limitCnt: Int {get set}
    var totalPgCnt: Int {get set}
    var tableReload: ((String) -> Void)? {get set}
    var errorHandler: ((String) -> Void)? {get set}
    var callDetailVC: ((PokemonDetailsModel) -> Void)? {get set}
    var isSearchBarEmpty: Bool {get}
    var startedSearching: ((Bool) -> Void)? {get set}
    var isFiltering: Bool {get}
    var searchController: UISearchController {get set}
    func callingPokemonAPI(addedOffsetVal: Int , isAdded: Bool)
    func getLastPage()
    func callAPI(offset: Int, limit: Int)
    func getPokemonDetails(urlStr: String?)
    func filterContentForSearchText(_ searchText: String)
   
}

class HomeViewModel:NSObject, HomeViewModelProtocol {
    
    var results: [PokResult] = []
    var filteredResults: [PokResult] = []
    var offsetCnt: Int = 0
    var limitCnt: Int = 20
    var totalPgCnt: Int = 0
    var tableReload: ((String) -> Void)?
    var callDetailVC: ((PokemonDetailsModel) -> Void)?
    var errorHandler: ((String) -> Void)?
    var startedSearching: ((Bool) -> Void)?
    var searchController: UISearchController = UISearchController(searchResultsController: nil)
    
    var isSearchBarEmpty: Bool {
      return searchController.searchBar.text?.isEmpty ?? true
    }
    
    var isFiltering: Bool {
        let condtion = searchController.isActive && !isSearchBarEmpty
        return condtion
    }
    
    override init() {
        super.init()
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search here"
    }
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
                self.errorHandler?(error)
            }
        }
        
    }
    
    func getPokemonDetails(urlStr: String?) {
        
        APILibrary.shared.apiCallPokemonDetail(urlStr: urlStr) { response in
            switch response {
            case .Success(let data):
                guard let pokeDetail = data.pokemonDetailsModel else {return}
                self.callDetailVC?(pokeDetail)
                
            case .Error(let error):
                self.errorHandler?(error)
            }
        }
        
    }

    func filterContentForSearchText(_ searchText: String) {
      filteredResults = results.filter { (pokResult: PokResult) -> Bool in
          return  (pokResult.name ?? "").lowercased().contains(searchText.lowercased())
      }
      
        tableReload?(String(self.totalPgCnt))
    }
}

// UITableViewDelegates
extension HomeViewModel {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
          return filteredResults.count
        }
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as? HomeTableViewCell else {
            fatalError("NO CELL CLASS FOUND")
        }
        
        isFiltering ? cell.config(filteredResults[indexPath.row]) : cell.config(results[indexPath.row])
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        isFiltering ?
        getPokemonDetails(urlStr: filteredResults[indexPath.row].url) :
        getPokemonDetails(urlStr: results[indexPath.row].url)
        
    }
}

//UISearchResultsUpdating
extension HomeViewModel {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterContentForSearchText(searchBar.text!)
    }
}

//UISearchBarDelegate
extension HomeViewModel  {
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        startedSearching?(true)
        return true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        startedSearching?(false)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        startedSearching?(false)
    }
}
