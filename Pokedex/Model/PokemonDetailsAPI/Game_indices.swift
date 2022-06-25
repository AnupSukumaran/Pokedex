/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com
For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Game_indices : Codable {
	let game_index : Int?
	let version : Version?

	enum CodingKeys: String, CodingKey {

		case game_index = "game_index"
		case version = "version"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		game_index = try values.decodeIfPresent(Int.self, forKey: .game_index)
		version = try values.decodeIfPresent(Version.self, forKey: .version)
	}

}
