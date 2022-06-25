/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com
For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct RedBlue: Codable {
	let backDefault: String?
	let backGray: String?
	let backTransparent: String?
	let frontDefault: String?
	let frontGray: String?
	let frontTransparent: String?

	enum CodingKeys: String, CodingKey {

		case backDefault = "back_default"
		case backGray = "back_gray"
		case backTransparent = "back_transparent"
		case frontDefault = "front_default"
		case frontGray = "front_gray"
		case frontTransparent = "front_transparent"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
        backDefault = try values.decodeIfPresent(String.self, forKey: .backDefault)
        backGray = try values.decodeIfPresent(String.self, forKey: .backGray)
        backTransparent = try values.decodeIfPresent(String.self, forKey: .backTransparent)
        frontDefault = try values.decodeIfPresent(String.self, forKey: .frontDefault)
        frontGray = try values.decodeIfPresent(String.self, forKey: .frontGray)
        frontTransparent = try values.decodeIfPresent(String.self, forKey: .frontTransparent)
	}

}
