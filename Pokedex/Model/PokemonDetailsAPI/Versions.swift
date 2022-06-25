/* 
Copyright (c) 2022 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Versions : Codable {
	let generationI : GenerationI?
	let generationII : GenerationII?
	let generationIII : GenerationIII?
	let generationIV : GenerationIV?
	let generationV : GenerationV?
	let generationVI : GenerationVI?
	let generationVII : GenerationVII?
	let generationVIII : GenerationVIII?

	enum CodingKeys: String, CodingKey {

		case generationI = "generation-i"
		case generationII = "generation-ii"
		case generationIII = "generation-iii"
		case generationIV = "generation-iv"
		case generationV = "generation-v"
		case generationVI = "generation-vi"
		case generationVII = "generation-vii"
		case generationVIII = "generation-viii"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
        generationI = try? values.decodeIfPresent(GenerationI.self, forKey: .generationI) ?? nil
        generationII = try? values.decodeIfPresent(GenerationII.self, forKey: .generationII) ?? nil
        generationIII = try? values.decodeIfPresent(GenerationIII.self, forKey: .generationIII) ?? nil
        generationIV = try? values.decodeIfPresent(GenerationIV.self, forKey: .generationIV) ?? nil
        generationV = try? values.decodeIfPresent(GenerationV.self, forKey: .generationV) ?? nil
        generationVI = try? values.decodeIfPresent(GenerationVI.self, forKey: .generationVI) ?? nil
        generationVII = try? values.decodeIfPresent(GenerationVII.self, forKey: .generationVII) ?? nil
        generationVIII = try? values.decodeIfPresent(GenerationVIII.self, forKey: .generationVIII) ?? nil
	}

}
