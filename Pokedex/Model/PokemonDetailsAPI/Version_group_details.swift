/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com
For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct VersionGroupDetails: Codable {
	let levelLearnedAt: Int?
	let moveLearnMethod: MoveLearnMethod?
	let versionGroup: VersionGroup?

	enum CodingKeys: String, CodingKey {

		case levelLearnedAt = "level_learned_at"
		case moveLearnMethod = "move_learn_method"
		case versionGroup = "version_group"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
        levelLearnedAt = try values.decodeIfPresent(Int.self, forKey: .levelLearnedAt)
        moveLearnMethod = try values.decodeIfPresent(MoveLearnMethod.self, forKey: .moveLearnMethod)
        versionGroup = try values.decodeIfPresent(VersionGroup.self, forKey: .versionGroup)
	}

}
