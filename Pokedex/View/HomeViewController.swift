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
        viewModel?.callAPI(offset: 0, limit: 1)
    }
    
    @IBAction func btnFirst(_ sender: Any) {
    }
    
    @IBAction func btnBack(_ sender: Any) {
    }
    
    @IBAction func btnFront(_ sender: Any) {
    }
    
    @IBAction func btnLast(_ sender: Any) {
    }
    
    
}

extension HomeViewController {
    
    func setHandler() {
        guard let viewM = viewModel else {
            fatalError("ViewModel Missing!")
        }
        
        viewM.tableReload = { [weak self] in
            guard let vc = self else {return}
            vc.pokemonTableView.reloadData()
        }
    }
    
}
