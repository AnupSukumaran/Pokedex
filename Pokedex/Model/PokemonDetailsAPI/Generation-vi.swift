/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com
For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct GenerationVI : Codable {
	let omegarubyAlphasapphire : OmegarubyAlphasapphire?
	let xy : XY?

	enum CodingKeys: String, CodingKey {

		case omegarubyAlphasapphire = "omegaruby-alphasapphire"
		case xy = "x-y"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		omegarubyAlphasapphire = try values.decodeIfPresent(OmegarubyAlphasapphire.self, forKey: .omegarubyAlphasapphire)
        xy = try values.decodeIfPresent(XY.self, forKey: .xy)
	}

}
