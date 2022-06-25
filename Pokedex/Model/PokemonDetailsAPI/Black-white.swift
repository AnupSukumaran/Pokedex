/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com
For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct BlackWhite: Codable {
	let animated: Animated?
	let backDefault: String?
	let backFemale: String?
	let backShiny: String?
	let backShinyFemale: String?
	let frontDefault: String?
	let frontFemale: String?
	let frontShiny: String?
	let frontShinyFemale: String?

	enum CodingKeys: String, CodingKey {

		case animated
		case backDefault = "back_default"
		case backFemale = "back_female"
		case backShiny = "back_shiny"
		case backShinyFemale = "back_shiny_female"
		case frontDefault = "front_default"
		case frontFemale = "front_female"
		case frontShiny = "front_shiny"
		case frontShinyFemale = "front_shiny_female"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		animated = try? values.decodeIfPresent(Animated.self, forKey: .animated) ?? nil
        backDefault = try? values.decodeIfPresent(String.self, forKey: .backDefault) ?? nil
        backFemale = try? values.decodeIfPresent(String.self, forKey: .backFemale) ?? nil
        backShiny = try? values.decodeIfPresent(String.self, forKey: .backShiny) ?? nil
        backShinyFemale = try? values.decodeIfPresent(String.self, forKey: .backShinyFemale) ?? nil
        frontDefault = try? values.decodeIfPresent(String.self, forKey: .frontDefault) ?? nil
        frontFemale = try? values.decodeIfPresent(String.self, forKey: .frontFemale) ?? nil
        frontShiny = try? values.decodeIfPresent(String.self, forKey: .frontShiny) ?? nil
        frontShinyFemale = try? values.decodeIfPresent(String.self, forKey: .frontShinyFemale) ?? nil
	}

}
