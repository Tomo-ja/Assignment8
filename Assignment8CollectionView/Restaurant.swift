//
//  Restaurant.swift
//  Assignment8CollectionView
//
//  Created by Tomonao Hashiguchi on 2022-05-27.
//

import Foundation

struct Restaurant{
    static let sampleRestautants: [Restaurant] = [
        Restaurant(name: "Saku", image: "saku", category: .Japanense, price: .middle, suitedTime: .dinner),
        Restaurant(name: "Jam Cafe", image: "jamCafe", category: .Cafe, price: .middle, suitedTime: .branch),
        Restaurant(name: "Zabu Chicken", image: "zabuChicken", category: .Korean, price: .middle, suitedTime: .dinner),
        Restaurant(name: "Cora", image: "cora", category: .Canadian, price: .low, suitedTime: .branch),
        Restaurant(name: "Miku", image: "miku", category: .Japanense, price: .expensive, suitedTime: .dinner),
        Restaurant(name: "Gyu-Kaku", image: "gyukaku", category: .Japanense, price: .expensive, suitedTime: .dinner),
        Restaurant(name: "PappaRoti", image: "pappaRoti", category: .Cafe, price: .low, suitedTime: .allDay),
        Restaurant(name: "Patron Tacos & Cantina", image: "patron", category: .Mexican, price: .middle, suitedTime: .dinner),
        Restaurant(name: "The Cambie Bar & Grill", image: "cambie", category: .Bar, price: .low, suitedTime: .dinner),
        Restaurant(name: "Red Robin", image: "redRobin", category: .Amerian, price: .middle, suitedTime: .allDay),
        Restaurant(name: "Taom", image: "tabom", category: .Korean, price: .expensive, suitedTime: .dinner),
        Restaurant(name: "Zoomak", image: "zoomak", category: .Korean, price: .middle, suitedTime: .dinner),
        Restaurant(name: "Nero waffles", image: "nero", category: .Cafe, price: .low, suitedTime: .branch),
        Restaurant(name: "OEB Breakfast Co.", image: "breakfastCo", category: .Canadian, price: .middle, suitedTime: .branch),
        Restaurant(name: "Chambar Restaurant", image: "chambar", category: .Canadian, price: .expensive, suitedTime: .dinner),
        Restaurant(name: "Rodney's Oyster House", image: "rodney", category: .Seafood, price: .middle, suitedTime: .allDay),
        Restaurant(name: "Tacofino", image: "tacofino", category: .Mexican, price: .middle, suitedTime: .allDay),
        Restaurant(name: "Di Beppe Restaurant", image: "diPippe", category: .Italian, price: .low, suitedTime: .allDay),
        Restaurant(name: "Joe Fortes Seafood & Chop House", image: "joeFortes", category: .Seafood, price: .expensive, suitedTime: .dinner),
        Restaurant(name: "zefferellis", image: "zefferellis", category: .Italian, price: .middle, suitedTime: .allDay),
        Restaurant(name: "Ramen DANBO", image: "danbo", category: .Japanense, price: .low, suitedTime: .dinner),
        Restaurant(name: "Cafe Medina", image: "medina", category: .Cafe, price: .low, suitedTime: .branch)
    ]
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
