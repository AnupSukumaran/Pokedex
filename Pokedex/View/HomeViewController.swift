//
//  HomeViewController.swift
//  Pokedex
//
//  Created by Sukumar Anup Sukumaran on 23/06/2022.
//

import UIKit
import SASCustomAlert

class HomeViewController: UIViewController {
    
    @IBOutlet weak var pokemonTableView: UITableView!
    @IBOutlet weak var btnFirst: UIButton!
    @IBOutlet weak var btnLast: UIButton!
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var lbPageNum: UILabel!
    @IBOutlet weak var btnFront: UIButton!
    @IBOutlet weak var baseBtnsView: UIView!
    @IBOutlet weak var activityIndic: UIActivityIndicatorView!
    var viewModel: HomeViewModelProtocol? {
        didSet {
            setHandler()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        searchBarAndTableSetUp()
        viewModelFuncs()
    }
    @IBAction func btnFirst(_ sender: Any) {
        viewModelFuncs()
    }
    @IBAction func btnBack(_ sender: Any) {
        paginationActions(false)
    }
    @IBAction func btnFront(_ sender: Any) {
        paginationActions(true)
    }
    @IBAction func btnLast(_ sender: Any) {
        activityStartAction(true)
        viewModel?.getLastPage()
    }
}

extension HomeViewController {
    func searchBarAndTableSetUp() {
        pokemonTableView.delegate = viewModel
        pokemonTableView.dataSource = viewModel
        navigationItem.searchController = viewModel?.searchController
        definesPresentationContext = true
    }
    func paginationActions(_ isAdded: Bool) {
        guard let viewM = viewModel else {
            fatalError("ViewModel Missing!")
        }
        activityStartAction(true)
        viewModel?.callingPokemonAPI(addedOffsetVal: viewM.limitCnt, isAdded: isAdded)
    }
    func viewModelFuncs() {
        guard let viewM = viewModel else {
            fatalError("ViewModel Missing!")
        }
        viewM.offsetCnt = 0
        activityStartAction(true)
        viewM.callAPI(offset: 0, limit: viewM.limitCnt)
    }
    func setHandler() {
        guard let viewM = viewModel else {
            fatalError("ViewModel Missing!")
        }
        viewM.tableReload = { [weak self] cnt in
            guard let cntr = self else {return}
            cntr.pokemonTableView.reloadData()
            cntr.activityStartAction(false)
            let offsetCnt = viewM.offsetCnt
            cntr.lbPageNum.text = "\(offsetCnt)/\(cnt)"
        }
        viewM.callDetailVC = { [weak self] modelData in
            guard let cntr = self else {return}
            cntr.activityStartAction(false)
            cntr.showDetailViewController(pokemonDetailsModel: modelData)
        }
        viewM.startedSearching = { [weak self] isSearching in
            guard let cntr = self else {return}
            cntr.baseBtnsView.alpha = isSearching ? 0.5 : 1
            cntr.baseBtnsView.isUserInteractionEnabled = !isSearching
        }
        viewM.didSelectedHandler = { [weak self] in
            guard let cntr = self else {return}
            cntr.activityStartAction(true)
        }
        viewM.errorHandler = { [weak self] erro in
            guard let cntr = self else {return}
            UIAlertController.showAlert(title: "Message", message: erro, buttonTitle: "OK", selfClass: cntr)
            cntr.activityStartAction(false)
        }
    }
    func activityStartAction(_ begin: Bool) {
        self.view.isUserInteractionEnabled = !begin
        self.view.alpha = begin ? 0.5 : 1
        guard begin else {
            activityIndic.stopAnimating()
            return
        }
        activityIndic.startAnimating()
    }
}
