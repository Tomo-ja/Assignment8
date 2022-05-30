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
    
    
    enum PriceRange: String{
        case low = "$"
        case middle = "$$"
        case expensive = "$$$"
    }
    
    enum SuitedTime{
        case branch, dinner, allDay
    }
}

enum Category: CaseIterable{
    case Japanense, Korean, Cafe, Canadian, Mexican, Bar, Amerian, Seafood, Italian
}
