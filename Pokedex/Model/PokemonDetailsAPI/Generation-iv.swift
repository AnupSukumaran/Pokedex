import Foundation
struct GenerationIV: Codable {
	let diamondPearl: DiamondPearl?
	let heartgoldSoulsilver: HeartgoldSoulsilver?
	let platinum: Platinum?

	enum CodingKeys: String, CodingKey {

		case diamondPearl = "diamond-pearl"
		case heartgoldSoulsilver = "heartgold-soulsilver"
		case platinum = "platinum"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		diamondPearl = try values.decodeIfPresent(DiamondPearl.self, forKey: .diamondPearl)
		heartgoldSoulsilver = try values.decodeIfPresent(HeartgoldSoulsilver.self, forKey: .heartgoldSoulsilver)
		platinum = try values.decodeIfPresent(Platinum.self, forKey: .platinum)
	}

}
