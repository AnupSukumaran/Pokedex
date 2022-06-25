/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com
For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct GenerationII: Codable {
	let crystal: Crystal?
	let gold: Gold?
	let silver: Silver?

	enum CodingKeys: String, CodingKey {

		case crystal
		case gold
		case silver
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		crystal = try values.decodeIfPresent(Crystal.self, forKey: .crystal)
		gold = try values.decodeIfPresent(Gold.self, forKey: .gold)
		silver = try values.decodeIfPresent(Silver.self, forKey: .silver)
	}

}
