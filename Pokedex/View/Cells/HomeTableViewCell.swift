//
//  HomeTableViewCell.swift
//  Pokedex
//
//  Created by Sukumar Anup Sukumaran on 23/06/2022.
//

import UIKit
import SDWebImage

class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var pokemonImgView: UIImageView!
    @IBOutlet private weak var lbTitleName: UILabel!
    @IBOutlet private weak var lbPokeID: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

extension HomeTableViewCell {
    
    func config(_ model: PokResult) {
        
        lbTitleName.text = (model.name ?? "").firstCapitalized
        setImage(url: model.url)
        
    }
    
    func setImage(url: String?) {
        let urlStr = String((url ?? "").dropLast())
        let urlChars = urlStr.components(separatedBy: "/")
        guard let id = urlChars.last else {
            pokemonImgView.image = UIImage(named: "pokeball")
            return
        }
        setPokeID(id)
        let imgUrlStr = URL.getUrl( host: Constants.APIBase.imgHost,
                                    path: Constants.APIBase.imgPath + id + ".png", [:])
        pokemonImgView.sd_setImage(with: imgUrlStr, placeholderImage: UIImage(named: "pokeball"))
    }
    
    func setPokeID(_ id: String) {
        let pokeID = (Int(id) ?? 0)
        lbPokeID.text = "#" + (String(format: "%03d", pokeID))
    }
}


