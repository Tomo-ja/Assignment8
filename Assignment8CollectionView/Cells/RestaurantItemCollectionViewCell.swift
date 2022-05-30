//
//  RestaurantItemCollectionViewCell.swift
//  Assignment8CollectionView
//
//  Created by Tomonao Hashiguchi on 2022-05-27.
//

import UIKit

class RestaurantItemCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "RestaurantCell"
    
    var varticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.alignment = .fill
        stackView.distribution = .fill
        return stackView
    }()
    
    var horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .top
        stackView.distribution = .fill
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.heightAnchor.constraint(equalToConstant: 126).isActive = true

        return imageView
    }()
    
    var restaurantNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    var detailsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        label.textAlignment = .right
        return label
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        varticalStackView.translatesAutoresizingMaskIntoConstraints = false
        varticalStackView.addArrangedSubview(restaurantNameLabel)
        varticalStackView.addArrangedSubview(detailsLabel)
        horizontalStackView.addArrangedSubview(varticalStackView)
        horizontalStackView.addArrangedSubview(priceLabel)
        addSubview(imageView)
        addSubview(horizontalStackView)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            horizontalStackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            horizontalStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            horizontalStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            horizontalStackView.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureCell(restaurant: Restaurant){
        imageView.image = UIImage(named: restaurant.image)
        restaurantNameLabel.text = restaurant.name
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
        detailsLabel.text = "\(restaurant.category) , \(restaurant.suitedTime)"
    }
}
