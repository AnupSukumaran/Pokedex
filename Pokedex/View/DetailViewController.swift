//
//  DetailViewController.swift
//  Pokedex
//
//  Created by Sukumar Anup Sukumaran on 24/06/2022.
//

import UIKit
import SDWebImage

class DetailViewController: UIViewController {
    @IBOutlet weak var mainImgView: UIImageView!
    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var lbType: UILabel!
    @IBOutlet weak var lbWeight: UILabel!
    @IBOutlet weak var lbHeight: UILabel!
    @IBOutlet weak var lbDefence: UILabel!
    @IBOutlet weak var lbBaseAttack: UILabel!
    @IBOutlet weak var abilitiesListView: UITableView!
    @IBOutlet weak var tableHeight: NSLayoutConstraint!
    @IBOutlet weak var nameView: UIView!
    @IBOutlet weak var statsView: UIView!
    @IBOutlet weak var abilitiesView: UIView!
    var viewModel: DetailViewModelProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        abilitiesListView.delegate = viewModel
        abilitiesListView.dataSource = viewModel
        setValues()
        settingViewCurves()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        adaptingContentWithTable()
    }
}

extension DetailViewController {
    func setValues() {
        guard let viewM = viewModel else {return}
        mainImgView.sd_setImage(with: URL(string: viewM.pokemonImgUrlStr ?? ""),
                                placeholderImage: UIImage(named: "pokeballNoBG"))
        pokemonName.text = viewM.pokemonName
        lbType.text = viewM.pokemonTypesStr
        lbHeight.text = viewM.pokemonHeight
        lbWeight.text = viewM.pokemonWeight
        lbDefence.text = viewM.pokemonDefence
        lbBaseAttack.text = viewM.pokemonBaseAtt
    }
    func settingViewCurves() {
        nameView.layer.cornerRadius = 10
        statsView.layer.cornerRadius = 10
        abilitiesView.layer.cornerRadius = 10
    }
    func adaptingContentWithTable() {
        abilitiesListView.reloadData()
        abilitiesListView.layoutIfNeeded()
        tableHeight.constant =  abilitiesListView.contentSize.height

    }
}
