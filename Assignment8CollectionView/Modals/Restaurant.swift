//
//  Restaurant.swift
//  Assignment8CollectionView
//
//  Created by Tomonao Hashiguchi on 2022-05-27.
//

import Foundation

struct Restaurant: Hashable{
    var id: Int
    var name: String
    var image: String
    var category: Category
    var price: PriceRange
    var suitedTime: SuitedTime
    
}


enum PriceRange: String, CaseIterable{
    case low = "$"
    case middle = "$$"
    case expensive = "$$$"
}

enum SuitedTime: String, CaseIterable{
    case branch = "Branch"
    case dinner = "Dinner"
    case allDay = "All Day"
}

enum Category: String, CaseIterable{
    case Japanense = "Japanense"
    case Korean = "Korean"
    case Cafe = "Cafe"
    case Canadian = "Canadian"
    case Mexican = "Mexican"
    case Bar = "Bar"
    case Amerian = "American"
    case Seafood = "Seafood"
    case Italian = "Italian"
}
