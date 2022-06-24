//
//  HomeViewController.swift
//  Pokedex
//
//  Created by Sukumar Anup Sukumaran on 23/06/2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var pokemonTableView: UITableView!
    @IBOutlet weak var btnFirst: UIButton!
    @IBOutlet weak var btnLast: UIButton!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var lbPageNum: UILabel!
    @IBOutlet weak var btnFront: UIButton!
    
    var viewModel: HomeViewModel? {
        didSet {
            setHandler()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        pokemonTableView.delegate = viewModel
        pokemonTableView.dataSource = viewModel
        viewModelFuncs()
    }
    
    @IBAction func btnFirst(_ sender: Any) {
        viewModelFuncs()
    }
    
    @IBAction func btnBack(_ sender: Any) {
        viewModel?.callingPokemonAPI(addedOffsetVal: 20, isAdded: false)
    }
    
    @IBAction func btnFront(_ sender: Any) {
        viewModel?.callingPokemonAPI(addedOffsetVal: 20)
    }
    
    @IBAction func btnLast(_ sender: Any) {
        viewModel?.getLastPage()
    }
    
    
}

extension HomeViewController {
    
    func viewModelFuncs() {
        guard let viewM = viewModel else {
            fatalError("ViewModel Missing!")
        }
        viewM.offsetCnt = 0
        viewM.callAPI()
    }
    
    func setHandler() {
        guard let viewM = viewModel else {
            fatalError("ViewModel Missing!")
        }
        
        viewM.tableReload = { [weak self] cnt in
            guard let vc = self else {return}
            vc.pokemonTableView.reloadData()
            let offsetCnt = viewM.offsetCnt
            vc.lbPageNum.text = "\(offsetCnt)/\(cnt)"
        }
    }
    
}
