/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com
For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Moves: Codable {
	let move: Move?
	let versionGroupDetails: [VersionGroupDetails]?

	enum CodingKeys: String, CodingKey {

		case move
		case versionGroupDetails = "version_group_details"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		move = try values.decodeIfPresent(Move.self, forKey: .move)
        versionGroupDetails = try values.decodeIfPresent([VersionGroupDetails].self, forKey: .versionGroupDetails)
	}

}
