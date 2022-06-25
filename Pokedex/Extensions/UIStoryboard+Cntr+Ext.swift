//
//  UIStoryboard+Cntr+Ext.swift
//  Pokedex
//
//  Created by Sukumar Anup Sukumaran on 24/06/2022.
//

import Foundation
import UIKit

fileprivate extension UIStoryboard {
    static func mainStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }

    static func detailViewController() -> DetailViewController? {
        return mainStoryboard()
                .instantiateViewController(
                    withIdentifier: Constants.Keys.detailViewController) as? DetailViewController
    }
}

extension UIViewController {
    func navPush(_ controller: UIViewController, title: String = "") {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: title, style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.tintColor = .white
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        navigationController?.navigationBar.topItem?.backBarButtonItem?.title = " "
        navigationController?.pushViewController(controller, animated: true)
    }
    func showDetailViewController(pokemonDetailsModel: PokemonDetailsModel) {
        guard let cntr = UIStoryboard.detailViewController() else {return}
        cntr.viewModel = DetailViewModel(pokemonDetailsModel: pokemonDetailsModel)
        cntr.title = "POKEDEX"
        navPush(cntr)
    }
}
