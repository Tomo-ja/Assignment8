//
//  FilterOptionCollectionViewCell.swift
//  Assignment8CollectionView
//
//  Created by Tomonao Hashiguchi on 2022-05-27.
//

import UIKit

class FilterOptionCollectionViewCell: UICollectionViewCell {
    @IBOutlet var filterOptionButton: UIButton!
    
    var filterOption: Category? = nil{
        didSet{
            guard let filterOption = filterOption else {return}
            filterOptionButton.setTitle("\(filterOption)", for: .normal)
        }
    }
}
