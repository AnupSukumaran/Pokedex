//
//  DetailViewModel.swift
//  Pokedex
//
//  Created by Sukumar Anup Sukumaran on 24/06/2022.
//

import Foundation
import UIKit

protocol DetailViewModelProtocol: UITableViewDataSource, UITableViewDelegate {
    var pokemonDetailsModel: PokemonDetailsModel? {get set}
    var pokemonImgUrlStr: String? {get}
    var pokemonName: String {get}
    var pokemonTypesStr: String {get}
    var pokemonWeight: String {get}
    var pokemonHeight: String {get}
    var pokemonStates: [Stats] {get}
    var pokemonDefence: String {get}
    var pokemonBaseAtt: String {get}
    var abilitiesArr: [Abilities] {get}
}

class DetailViewModel: NSObject, DetailViewModelProtocol {
    var pokemonDetailsModel: PokemonDetailsModel?
    var pokemonImgUrlStr: String? {
        return pokemonDetailsModel?.sprites?.other?.home?.frontDefault
    }
    var pokemonName: String {
        return (pokemonDetailsModel?.name ?? "").firstCapitalized
    }
    var pokemonTypesStr: String {
        let typesArr = pokemonDetailsModel?.types ?? []
        let pokemonType = typesArr.map {$0.type?.name}.compactMap {$0}
        return pokemonType.joined(separator: ", ")
    }
    var pokemonWeight: String {
        String(pokemonDetailsModel?.weight ?? 0)
    }
    var pokemonHeight: String {
        String(pokemonDetailsModel?.height ?? 0)
    }
    var pokemonStates: [Stats] {
        pokemonDetailsModel?.stats ?? []
    }
    var pokemonDefence: String {
        let states = pokemonStates.filter {($0.stat?.name ?? "") == "defense"}.first
        return String(states?.baseStat ?? 0)
    }
    var pokemonBaseAtt: String {
        let states = pokemonStates.filter {($0.stat?.name ?? "") == "attack"}.first
        return String(states?.baseStat ?? 0)
    }
    var abilitiesArr: [Abilities] {
        pokemonDetailsModel?.abilities ?? []
    }
    override init() {}
    init(pokemonDetailsModel: PokemonDetailsModel?) {
        self.pokemonDetailsModel = pokemonDetailsModel
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return abilitiesArr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AbilitiesTableViewCell",
                                                       for: indexPath) as? AbilitiesTableViewCell
        else {
            fatalError("No Cell Class Found")
        }
        cell.config(modelData: abilitiesArr[indexPath.row])
        return cell
    }

}
