/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com
For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Platinum : Codable {
	let backDefault : String?
	let back_female : String?
	let back_shiny : String?
	let back_shiny_female : String?
	let front_default : String?
	let front_female : String?
	let frontShiny : String?
	let frontShiny_female : String?

	enum CodingKeys: String, CodingKey {

		case backDefault = "back_default"
		case back_female = "back_female"
		case back_shiny = "back_shiny"
		case back_shiny_female = "back_shiny_female"
		case front_default = "front_default"
		case front_female = "front_female"
		case frontShiny = "front_shiny"
		case frontShiny_female = "front_shiny_female"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		backDefault = try values.decodeIfPresent(String.self, forKey: .backDefault)
		back_female = try values.decodeIfPresent(String.self, forKey: .back_female)
		back_shiny = try values.decodeIfPresent(String.self, forKey: .back_shiny)
		back_shiny_female = try values.decodeIfPresent(String.self, forKey: .back_shiny_female)
		front_default = try values.decodeIfPresent(String.self, forKey: .front_default)
		front_female = try values.decodeIfPresent(String.self, forKey: .front_female)
		frontShiny = try values.decodeIfPresent(String.self, forKey: .frontShiny)
		frontShiny_female = try values.decodeIfPresent(String.self, forKey: .frontShiny_female)
	}

}
