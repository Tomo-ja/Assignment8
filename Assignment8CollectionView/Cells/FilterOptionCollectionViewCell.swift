//
//  FilterOptionCollectionViewCell.swift
//  Assignment8CollectionView
//
//  Created by Tomonao Hashiguchi on 2022-05-27.
//

import UIKit


class FilterOptionCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "filterOptionCell"
    
    
    var filterButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .white
        button.titleLabel!.font = UIFont.systemFont(ofSize: 10)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.isUserInteractionEnabled = false
        return button
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        filterButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(filterButton)
        NSLayoutConstraint.activate([
            filterButton.topAnchor.constraint(equalTo: topAnchor),
            filterButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            filterButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            filterButton.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(filterOption: FilterCategory){
        filterButton.setTitle(filterOption.name, for: .normal)
    }

}

