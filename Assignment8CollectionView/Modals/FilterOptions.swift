//
//  FilterOptions.swift
//  Assignment8CollectionView
//
//  Created by Tomonao Hashiguchi on 2022-05-30.
//

import Foundation
struct FilterOption: Hashable{
    let name: String
    let kind: FilterType
    
//    static let allFilters = []
}

enum FilterType{
    case price, time, category
}
