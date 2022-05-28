//
//  Item.swift
//  Assignment8CollectionView
//
//  Created by Tomonao Hashiguchi on 2022-05-28.
//

import Foundation

enum Item: Hashable{
    
    case filter(FilterCategory)
    case restaurant(Restaurant)
    
    var filter: FilterCategory? {
        if case .filter(let filter) = self {
            return filter
        }else{
            return nil
        }
    }
    
    var restaurant: Restaurant?{
        if case .restaurant(let restaurant) = self {
            return restaurant
        } else {
            return nil
        }
    }
    
    static let filterItems: [Item] = Category.allCases.map { .filter(FilterCategory(name: "\($0)"))}
    static let restaurantItem: [Item] = [
        .restaurant(Restaurant(name: "Saku", image: "saku", category: .Japanense, price: .middle, suitedTime: .dinner)),
        .restaurant(Restaurant(name: "Jam Cafe", image: "jamCafe", category: .Cafe, price: .middle, suitedTime: .branch)),
        .restaurant(Restaurant(name: "Zabu Chicken", image: "zabuChicken", category: .Korean, price: .middle, suitedTime: .dinner)),
        .restaurant(Restaurant(name: "Cora", image: "cora", category: .Canadian, price: .low, suitedTime: .branch)),
        .restaurant(Restaurant(name: "Miku", image: "miku", category: .Japanense, price: .expensive, suitedTime: .dinner)),
        .restaurant(Restaurant(name: "Gyu-Kaku", image: "gyukaku", category: .Japanense, price: .expensive, suitedTime: .dinner)),
        .restaurant(Restaurant(name: "PappaRoti", image: "pappaRoti", category: .Cafe, price: .low, suitedTime: .allDay)),
        .restaurant( Restaurant(name: "Patron Tacos & Cantina", image: "patron", category: .Mexican, price: .middle, suitedTime: .dinner)),
        .restaurant(Restaurant(name: "The Cambie Bar & Grill", image: "cambie", category: .Bar, price: .low, suitedTime: .dinner)),
        .restaurant( Restaurant(name: "Red Robin", image: "redRobin", category: .Amerian, price: .middle, suitedTime: .allDay)),
        .restaurant(Restaurant(name: "Taom", image: "tabom", category: .Korean, price: .expensive, suitedTime: .dinner)),
        .restaurant(Restaurant(name: "Zoomak", image: "zoomak", category: .Korean, price: .middle, suitedTime: .dinner)),
        .restaurant(Restaurant(name: "Nero waffles", image: "nero", category: .Cafe, price: .low, suitedTime: .branch)),
        .restaurant( Restaurant(name: "OEB Breakfast Co.", image: "breakfastCo", category: .Canadian, price: .middle, suitedTime: .branch)),
        .restaurant(Restaurant(name: "Chambar Restaurant", image: "chambar", category: .Canadian, price: .expensive, suitedTime: .dinner)),
        .restaurant(Restaurant(name: "Rodney's Oyster House", image: "rodney", category: .Seafood, price: .middle, suitedTime: .allDay)),
        .restaurant(Restaurant(name: "Tacofino", image: "tacofino", category: .Mexican, price: .middle, suitedTime: .allDay)),
        .restaurant(Restaurant(name: "Di Beppe Restaurant", image: "diPippe", category: .Italian, price: .low, suitedTime: .allDay)),
        .restaurant(Restaurant(name: "Joe Fortes Seafood & Chop House", image: "joeFortes", category: .Seafood, price: .expensive, suitedTime: .dinner)),
        .restaurant(Restaurant(name: "zefferellis", image: "zefferellis", category: .Italian, price: .middle, suitedTime: .allDay)),
        .restaurant(Restaurant(name: "Ramen DANBO", image: "danbo", category: .Japanense, price: .low, suitedTime: .dinner)),
        .restaurant(Restaurant(name: "Cafe Medina", image: "medina", category: .Cafe, price: .low, suitedTime: .branch))
    ]
}
