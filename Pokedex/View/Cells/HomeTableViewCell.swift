//
//  HomeTableViewCell.swift
//  Pokedex
//
//  Created by Sukumar Anup Sukumaran on 23/06/2022.
//

import UIKit
import SDWebImage

class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var pokemonImgView: UIImageView!
    @IBOutlet weak var lbTitleName: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
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
        let imgUrlStr = URL.getUrl( host: Constants.APIBase.imgHost, path: Constants.APIBase.imgPath + id + ".png", [:])
        print("imgUrlStr = \(imgUrlStr)")
        pokemonImgView.sd_setImage(with: imgUrlStr, placeholderImage: UIImage(named: "pokeball"))
    }
}


