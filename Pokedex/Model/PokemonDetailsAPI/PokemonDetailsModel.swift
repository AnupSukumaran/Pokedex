import Foundation
struct PokemonDetailsModel: Codable {
	let abilities: [Abilities]?
	let baseExperience: Int?
	let forms: [Forms]?
	let gameIndices: [Game_indices]?
	let height: Int?
	let heldItems: [String]?
	let id: Int?
	let isDefault: Bool?
	let locationAreaEncounters: String?
    let moves: [Moves]?
	let name: String?
	let order: Int?
	let pastTypes: [String]?
	let species: Species?
	let sprites: Sprites?
	let stats: [Stats]?
	let types: [Types]?
	let weight: Int?

	enum CodingKeys: String, CodingKey {

		case abilities
		case baseExperience = "base_experience"
		case forms
		case gameIndices = "game_indices"
		case height
		case heldItems = "held_items"
		case id
		case isDefault = "is_default"
		case locationAreaEncounters = "location_area_encounters"
		case moves
		case name
		case order
		case pastTypes = "past_types"
		case species
		case sprites
		case stats
		case types
		case weight
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		abilities = try? values.decodeIfPresent([Abilities].self, forKey: .abilities) ?? nil
        baseExperience = try? values.decodeIfPresent(Int.self, forKey: .baseExperience) ?? nil
		forms = try? values.decodeIfPresent([Forms].self, forKey: .forms) ?? nil
        gameIndices = try? values.decodeIfPresent([Game_indices].self, forKey: .gameIndices) ?? nil
		height = try? values.decodeIfPresent(Int.self, forKey: .height) ?? nil
		heldItems = try? values.decodeIfPresent([String].self, forKey: .heldItems) ?? nil
		id = try? values.decodeIfPresent(Int.self, forKey: .id) ?? nil
		isDefault = try? values.decodeIfPresent(Bool.self, forKey: .isDefault) ?? nil
		locationAreaEncounters = try? values.decodeIfPresent(String.self, forKey: .locationAreaEncounters) ?? nil
		moves = try? values.decodeIfPresent([Moves].self, forKey: .moves) ?? nil
		name = try? values.decodeIfPresent(String.self, forKey: .name) ?? nil
		order = try? values.decodeIfPresent(Int.self, forKey: .order) ?? nil
		pastTypes = try? values.decodeIfPresent([String].self, forKey: .pastTypes) ?? nil
		species = try? values.decodeIfPresent(Species.self, forKey: .species) ?? nil
		sprites = try? values.decodeIfPresent(Sprites.self, forKey: .sprites) ?? nil
		stats = try? values.decodeIfPresent([Stats].self, forKey: .stats) ?? nil
		types = try? values.decodeIfPresent([Types].self, forKey: .types) ?? nil
		weight = try? values.decodeIfPresent(Int.self, forKey: .weight) ?? nil
	}

}
