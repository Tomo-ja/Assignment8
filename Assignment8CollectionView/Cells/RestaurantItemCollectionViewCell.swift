//
//  RestaurantItemCollectionViewCell.swift
//  Assignment8CollectionView
//
//  Created by Tomonao Hashiguchi on 2022-05-27.
//

import UIKit

class RestaurantItemCollectionViewCell: UICollectionViewCell {
   
    @IBOutlet var previewImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var detailLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    
    var restaurant: Restaurant? = nil {
        didSet{
            guard let restaurant = restaurant else {
                return
            }
            previewImageView.image = UIImage(named: restaurant.image)
            nameLabel.text = restaurant.name
            priceLabel.text = {
                switch restaurant.price{
                    case .low:
                        return "$"
                    case .middle:
                        return "$$"
                    case .expensive:
                        return "$$$"
                }
            }()
            detailLabel.text = "\(restaurant.category) , \(restaurant.suitedTime)"
        }
    }
}
