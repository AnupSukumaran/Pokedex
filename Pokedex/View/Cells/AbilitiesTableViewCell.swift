//
//  AbilitiesTableViewCell.swift
//  Pokedex
//
//  Created by Sukumar Anup Sukumaran on 24/06/2022.
//

import UIKit

class AbilitiesTableViewCell: UITableViewCell {

    @IBOutlet weak var lbAbility: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        lbAbility.layer.cornerRadius = 10
        lbAbility.layer.masksToBounds = true
    }

}

extension AbilitiesTableViewCell {
    func config(modelData: Abilities) {
        lbAbility.text = (modelData.ability?.name ?? "--").firstCapitalized
    }
}
