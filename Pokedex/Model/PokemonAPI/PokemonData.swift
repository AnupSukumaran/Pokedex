/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com
For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct PokemonData: Codable {
	let count: Int?
	let next: String?
	let previous: String?
	let results: [PokResult]?

	enum CodingKeys: String, CodingKey {

		case count
		case next
		case previous
		case results
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		count = try? values.decodeIfPresent(Int.self, forKey: .count) ?? nil
		next = try? values.decodeIfPresent(String.self, forKey: .next) ?? nil
		previous = try? values.decodeIfPresent(String.self, forKey: .previous) ?? nil
		results = try? values.decodeIfPresent([PokResult].self, forKey: .results) ?? nil
	}

}
