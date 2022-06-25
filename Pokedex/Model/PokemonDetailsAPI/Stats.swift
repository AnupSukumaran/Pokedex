/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com
For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Stats: Codable {
	let baseStat: Int?
	let effort: Int?
	let stat: Stat?

	enum CodingKeys: String, CodingKey {

		case baseStat = "base_stat"
		case effort
		case stat
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
        baseStat = try values.decodeIfPresent(Int.self, forKey: .baseStat)
		effort = try values.decodeIfPresent(Int.self, forKey: .effort)
		stat = try values.decodeIfPresent(Stat.self, forKey: .stat)
	}

}
