/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com
For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Crystal: Codable {
	let backDefault: String?
	let backShiny: String?
	let backShinyTransparent: String?
	let backTransparent: String?
	let frontDefault: String?
	let frontShiny: String?
	let frontShinyTransparent: String?
	let frontTransparent: String?

	enum CodingKeys: String, CodingKey {

		case backDefault = "back_default"
		case backShiny = "back_shiny"
		case backShinyTransparent = "back_shiny_transparent"
		case backTransparent = "back_transparent"
		case frontDefault = "front_default"
		case frontShiny = "front_shiny"
		case frontShinyTransparent = "front_shiny_transparent"
		case frontTransparent = "front_transparent"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		backDefault = try? values.decodeIfPresent(String.self, forKey: .back_default) ?? nil
		back_shiny = try? values.decodeIfPresent(String.self, forKey: .back_shiny) ?? nil
        backShinyTransparent = try? values.decodeIfPresent(String.self, forKey: .backShinyTransparent) ?? nil
        backTransparent = try? values.decodeIfPresent(String.self, forKey: .backTransparent) ?? nil
        frontDefault = try? values.decodeIfPresent(String.self, forKey: .frontDefault) ?? nil
		frontShiny = try? values.decodeIfPresent(String.self, forKey: .frontShiny) ?? nil
        frontShinyTransparent = try? values.decodeIfPresent(String.self, forKey: .frontShinyTransparent) ?? nil
        frontTransparent = try? values.decodeIfPresent(String.self, forKey: .frontTransparent) ?? nil
	}

}
