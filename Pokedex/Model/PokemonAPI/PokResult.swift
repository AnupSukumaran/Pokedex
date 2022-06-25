/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com
For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct PokResult: Codable {
	let name: String?
	let url: String?

	enum CodingKeys: String, CodingKey {

		case name
		case url
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		name = try? values.decodeIfPresent(String.self, forKey: .name) ?? nil
		url = try? values.decodeIfPresent(String.self, forKey: .url) ?? nil
	}

}
