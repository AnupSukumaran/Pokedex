/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com
For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Types: Codable {
	let slot: Int?
	let type: TypeData?

	enum CodingKeys: String, CodingKey {
		case slot
		case type
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		slot = try values.decodeIfPresent(Int.self, forKey: .slot)
		type = try values.decodeIfPresent(TypeData.self, forKey: .type)
	}

}
