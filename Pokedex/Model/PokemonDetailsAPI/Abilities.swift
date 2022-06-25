/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com
For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Abilities: Codable {
	let ability: Ability?
	let isHidden: Bool?
	let slot: Int?

	enum CodingKeys: String, CodingKey {

		case ability = "ability"
		case isHidden = "is_hidden"
		case slot = "slot"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		ability = try? values.decodeIfPresent(Ability.self, forKey: .ability) ?? nil
        isHidden = try? values.decodeIfPresent(Bool.self, forKey: .isHidden) ?? nil
		slot = try? values.decodeIfPresent(Int.self, forKey: .slot) ?? nil
	}

}
