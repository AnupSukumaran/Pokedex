//
//  ModelResponse.swift
//  Pokedex
//
//  Created by Sukumar Anup Sukumaran on 23/06/2022.
//

import Foundation

final class ModelResponse: Codable {
    var pokemonAPIData: PokemonData?
    var pokemonDetailsModel: PokemonDetailsModel?
    init(data: Data) throws {
        pokemonAPIData = try? JSONDecoder().decode(PokemonData.self, from: data)
        pokemonDetailsModel  = try? JSONDecoder().decode(PokemonDetailsModel.self, from: data)
    }
}
