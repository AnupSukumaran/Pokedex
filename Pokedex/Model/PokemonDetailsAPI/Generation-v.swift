/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com
For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct GenerationV: Codable {
	let blackWhite: BlackWhite?

	enum CodingKeys: String, CodingKey {

		case blackWhite = "black-white"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		blackWhite = try values.decodeIfPresent(BlackWhite.self, forKey: .blackWhite)
	}

}
