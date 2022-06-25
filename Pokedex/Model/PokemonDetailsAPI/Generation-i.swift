/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com
For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct GenerationI: Codable {
	let redBlue: RedBlue?
	let yellow: Yellow?

	enum CodingKeys: String, CodingKey {

		case redBlue = "red-blue"
		case yellow = "yellow"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		redBlue = try values.decodeIfPresent(RedBlue.self, forKey: .redBlue)
		yellow = try values.decodeIfPresent(Yellow.self, forKey: .yellow)
	}

}
