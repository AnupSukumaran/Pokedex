/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com
For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct GenerationIII: Codable {
	let emerald: Emerald?
	let fireredLeafgreen: FireredLeafgreen?
	let rubySapphire: RubySapphire?

	enum CodingKeys: String, CodingKey {

		case emerald = "emerald"
		case fireredLeafgreen = "firered-leafgreen"
		case rubySapphire = "ruby-sapphire"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		emerald = try values.decodeIfPresent(Emerald.self, forKey: .emerald)
		fireredLeafgreen = try values.decodeIfPresent(FireredLeafgreen.self, forKey: .fireredLeafgreen)
		rubySapphire = try values.decodeIfPresent(RubySapphire.self, forKey: .rubySapphire)
	}

}
