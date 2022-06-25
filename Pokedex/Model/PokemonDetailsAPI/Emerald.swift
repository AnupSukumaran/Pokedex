/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com
For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Emerald: Codable {
	let frontDefault: String?
	let frontShiny: String?

	enum CodingKeys: String, CodingKey {

		case frontDefault = "front_default"
		case frontShiny = "front_shiny"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		frontDefault = try values.decodeIfPresent(String.self, forKey: .frontDefault)
		frontShiny = try values.decodeIfPresent(String.self, forKey: .frontShiny)
	}

}
