//
//  Constants.swift
//  Pokedex
//
//  Created by Sukumar Anup Sukumaran on 23/06/2022.
//

import Foundation

struct Constants {
    struct APIBase {
        static let scheme = "https"
        static let host = "pokeapi.co"
        static let path = "/api/v2"
        static let imgHost = "raw.githubusercontent.com"
        static let imgPath = "/PokeAPI/sprites/master/sprites/pokemon/"
    }
    struct PathExt {
        static let pokemon = "/pokemon"
    }
    struct Keys {
        static let detailViewController = "DetailViewController"
    }
    struct Txt {
        static let defaultErrorMsg = "Something went wrong!!.Please try again."
    }
}
