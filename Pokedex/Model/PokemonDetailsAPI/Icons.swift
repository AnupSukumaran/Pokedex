/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com
For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Icons: Codable {
	let frontDefault: String?
	let frontDemale: String?

	enum CodingKeys: String, CodingKey {

		case frontDefault = "front_default"
		case frontFemale = "front_female"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
        frontDefault = try values.decodeIfPresent(String.self, forKey: .frontDefault)
        frontDemale = try values.decodeIfPresent(String.self, forKey: .frontDemale)
	}

}
