//
//  ResultEnums.swift
//  Pokedex
//
//  Created by Sukumar Anup Sukumaran on 23/06/2022.
//

import Foundation

enum Results<T> {
    case success(T)
    case error(String)
}
