/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com
For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct GenerationVIII: Codable {
	let icons: Icons?

	enum CodingKeys: String, CodingKey {

		case icons
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		icons = try values.decodeIfPresent(Icons.self, forKey: .icons)
	}

}
