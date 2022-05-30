//
//  Item.swift
//  Assignment8CollectionView
//
//  Created by Tomonao Hashiguchi on 2022-05-28.
//

import Foundation

enum Item: Hashable{
    
    case filter(FilterOption)
    case restaurant(Restaurant)
    
    var filter: FilterOption? {
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
    
    static let filterItems: [Item] = {
        let priceRange: [Item] = PriceRange.allCases.map{ .filter(FilterOption(name: "\($0.rawValue)", kind: .price))}
        let timeSute: [Item] = SuitedTime.allCases.map{ .filter(FilterOption(name: "\($0.rawValue)", kind: .time))}
        let catetory: [Item] = Category.allCases.map { .filter(FilterOption(name: "\($0.rawValue)", kind: .category))}
        
        return (priceRange + timeSute + catetory)
    }()
    
    static let restaurantItem: [Item] = [
        .restaurant(Restaurant(id: 1, name: "Saku", image: "saku", category: .Japanense, price: .middle, suitedTime: .dinner)),
        .restaurant(Restaurant(id: 2, name: "Jam Cafe", image: "jamCafe", category: .Cafe, price: .middle, suitedTime: .branch)),
        .restaurant(Restaurant(id: 3, name: "Zabu Chicken", image: "zabuChicken", category: .Korean, price: .middle, suitedTime: .dinner)),
        .restaurant(Restaurant(id: 4, name: "Cora", image: "cora", category: .Canadian, price: .low, suitedTime: .branch)),
        .restaurant(Restaurant(id: 5, name: "Miku", image: "miku", category: .Japanense, price: .expensive, suitedTime: .dinner)),
        .restaurant(Restaurant(id: 6, name: "Gyu-Kaku", image: "gyukaku", category: .Japanense, price: .expensive, suitedTime: .dinner)),
        .restaurant(Restaurant(id: 7, name: "PappaRoti", image: "pappaRoti", category: .Cafe, price: .low, suitedTime: .allDay)),
        .restaurant( Restaurant(id: 8, name: "Patron Tacos & Cantina", image: "patron", category: .Mexican, price: .middle, suitedTime: .dinner)),
        .restaurant(Restaurant(id: 9, name: "The Cambie Bar & Grill", image: "cambie", category: .Bar, price: .low, suitedTime: .dinner)),
        .restaurant( Restaurant(id: 10, name: "Red Robin", image: "redRobin", category: .Amerian, price: .middle, suitedTime: .allDay)),
        .restaurant(Restaurant(id: 11, name: "Tabom", image: "tabom", category: .Korean, price: .expensive, suitedTime: .dinner)),
        .restaurant(Restaurant(id: 12, name: "Zoomak", image: "zoomak", category: .Korean, price: .middle, suitedTime: .dinner)),
        .restaurant(Restaurant(id: 13, name: "Nero waffles", image: "nero", category: .Cafe, price: .low, suitedTime: .branch)),
        .restaurant( Restaurant(id: 14, name: "OEB Breakfast Co.", image: "breakfastCo", category: .Canadian, price: .middle, suitedTime: .branch)),
        .restaurant(Restaurant(id: 15, name: "Chambar Restaurant", image: "chambar", category: .Canadian, price: .expensive, suitedTime: .dinner)),
        .restaurant(Restaurant(id: 16, name: "Rodney's Oyster House", image: "rodney", category: .Seafood, price: .middle, suitedTime: .allDay)),
        .restaurant(Restaurant(id: 17, name: "Tacofino", image: "tacofino", category: .Mexican, price: .middle, suitedTime: .allDay)),
        .restaurant(Restaurant(id: 18, name: "Di Beppe Restaurant", image: "diPippe", category: .Italian, price: .low, suitedTime: .allDay)),
        .restaurant(Restaurant(id: 19, name: "Joe Fortes Seafood & Chop House", image: "joeFortes", category: .Seafood, price: .expensive, suitedTime: .dinner)),
        .restaurant(Restaurant(id: 20, name: "zefferellis", image: "zefferellis", category: .Italian, price: .middle, suitedTime: .allDay)),
        .restaurant(Restaurant(id: 21, name: "Ramen DANBO", image: "danbo", category: .Japanense, price: .low, suitedTime: .dinner)),
        .restaurant(Restaurant(id: 22, name: "Cafe Medina", image: "medina", category: .Cafe, price: .low, suitedTime: .branch))
    ]
    
    static func < (left: Item, right: Item) -> Bool{
        return left.restaurant!.id < right.restaurant!.id
    }
}
