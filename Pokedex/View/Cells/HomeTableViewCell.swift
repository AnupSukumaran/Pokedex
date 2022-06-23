//
//  HomeTableViewCell.swift
//  Pokedex
//
//  Created by Sukumar Anup Sukumaran on 23/06/2022.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
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
        lbTitleName.text = model.name
    }
}
