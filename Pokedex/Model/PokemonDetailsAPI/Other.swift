/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com
For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Other: Codable {
	let dreamWorld: DreamWorld?
	let home: Home?
	let officialArtwork: OfficialArtwork?

	enum CodingKeys: String, CodingKey {

		case dreamWorld = "dream_world"
		case home
		case officialArtwork = "official-artwork"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
        dreamWorld = try values.decodeIfPresent(DreamWorld.self, forKey: .dreamWorld)
		home = try values.decodeIfPresent(Home.self, forKey: .home)
		officialArtwork = try values.decodeIfPresent(OfficialArtwork.self, forKey: .officialArtwork)
	}

}
