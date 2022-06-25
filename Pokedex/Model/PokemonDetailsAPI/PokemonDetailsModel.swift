

import Foundation
struct PokemonDetailsModel : Codable {
	let abilities : [Abilities]?
	let base_experience : Int?
	let forms : [Forms]?
	let game_indices : [Game_indices]?
	let height : Int?
	let held_items : [String]?
	let id : Int?
	let is_default : Bool?
	let location_area_encounters : String?
	let moves : [Moves]?
	let name : String?
	let order : Int?
	let past_types : [String]?
	let species : Species?
	let sprites : Sprites?
	let stats : [Stats]?
	let types : [Types]?
	let weight : Int?

	enum CodingKeys: String, CodingKey {

		case abilities = "abilities"
		case base_experience = "base_experience"
		case forms = "forms"
		case game_indices = "game_indices"
		case height = "height"
		case held_items = "held_items"
		case id = "id"
		case is_default = "is_default"
		case location_area_encounters = "location_area_encounters"
		case moves = "moves"
		case name = "name"
		case order = "order"
		case past_types = "past_types"
		case species = "species"
		case sprites = "sprites"
		case stats = "stats"
		case types = "types"
		case weight = "weight"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		abilities = try? values.decodeIfPresent([Abilities].self, forKey: .abilities) ?? nil
		base_experience = try? values.decodeIfPresent(Int.self, forKey: .base_experience) ?? nil
		forms = try? values.decodeIfPresent([Forms].self, forKey: .forms) ?? nil
		game_indices = try? values.decodeIfPresent([Game_indices].self, forKey: .game_indices) ?? nil
		height = try? values.decodeIfPresent(Int.self, forKey: .height) ?? nil
		held_items = try? values.decodeIfPresent([String].self, forKey: .held_items) ?? nil
		id = try? values.decodeIfPresent(Int.self, forKey: .id) ?? nil
		is_default = try? values.decodeIfPresent(Bool.self, forKey: .is_default) ?? nil
		location_area_encounters = try? values.decodeIfPresent(String.self, forKey: .location_area_encounters) ?? nil
		moves = try? values.decodeIfPresent([Moves].self, forKey: .moves) ?? nil
		name = try? values.decodeIfPresent(String.self, forKey: .name) ?? nil
		order = try? values.decodeIfPresent(Int.self, forKey: .order) ?? nil
		past_types = try? values.decodeIfPresent([String].self, forKey: .past_types) ?? nil
		species = try? values.decodeIfPresent(Species.self, forKey: .species) ?? nil
		sprites = try? values.decodeIfPresent(Sprites.self, forKey: .sprites) ?? nil
		stats = try? values.decodeIfPresent([Stats].self, forKey: .stats) ?? nil
		types = try? values.decodeIfPresent([Types].self, forKey: .types) ?? nil
		weight = try? values.decodeIfPresent(Int.self, forKey: .weight) ?? nil
	}

}
