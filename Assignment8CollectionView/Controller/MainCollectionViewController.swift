//
//  MainCollectionViewController.swift
//  Assignment8CollectionView
//
//  Created by Tomonao Hashiguchi on 2022-05-27.
//

import UIKit

class MainCollectionViewController: UICollectionViewController {
    
    enum Section: Hashable{
        case filterOption, restaurantList
    }
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    var sections = [Section]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.backgroundColor = .darkGray
        
        collectionView.collectionViewLayout = createLayout()
        
        collectionView.register(FilterOptionCollectionViewCell.self, forCellWithReuseIdentifier: FilterOptionCollectionViewCell.reuseIdentifier)
        collectionView.register(RestaurantItemCollectionViewCell.self, forCellWithReuseIdentifier: RestaurantItemCollectionViewCell.reuseIdentifier)
        
        configureDataSource()
    }
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.barStyle = .black
    }
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    func configureDataSource(){
        dataSource = .init(collectionView: collectionView, cellProvider: { (collectionView, indexPath, item) -> UICollectionViewCell? in
            let section = self.sections[indexPath.section]
            switch section{
            case .filterOption:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilterOptionCollectionViewCell.reuseIdentifier, for: indexPath) as! FilterOptionCollectionViewCell
                
                cell.configureCell(filterOption: item.filter!)
                return cell
            case .restaurantList:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RestaurantItemCollectionViewCell.reuseIdentifier, for: indexPath) as! RestaurantItemCollectionViewCell
                cell.backgroundColor = .white
                cell.layer.cornerRadius = 8
                cell.clipsToBounds = true
                cell.configureCell(restaurant: item.restaurant!)
                return cell
            }
        })
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.filterOption, .restaurantList])
        snapshot.appendItems(Item.filterItems, toSection: .filterOption)
        snapshot.appendItems(Item.restaurantItem, toSection: .restaurantList)
        sections = snapshot.sectionIdentifiers
        
        dataSource.apply(snapshot)
    }
    
    func createLayout() -> UICollectionViewLayout{
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            let section = self.sections[sectionIndex]
            switch section{
            case .filterOption:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
//                item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 0)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.4), heightDimension: .absolute(50))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                group.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                return section
            case .restaurantList:
                let spacing: CGFloat = 10
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: spacing)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(200))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
                group.contentInsets = NSDirectionalEdgeInsets(top: spacing, leading: spacing, bottom: 0, trailing: 0)
                let section = NSCollectionLayoutSection(group: group)
                
                return section
            }
        }
        return layout
    }
    
    func generateLayoutOfRestaurant() -> UICollectionViewLayout{
        let spacing: CGFloat = 10
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: spacing)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(200))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        group.contentInsets = NSDirectionalEdgeInsets(top: spacing, leading: spacing, bottom: 0, trailing: 0)
        
        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }

    func generateLayoutOfFilterOptions() -> UICollectionViewLayout{
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 0, bottom: 15, trailing: 30)
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }

}
