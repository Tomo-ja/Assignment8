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
    var filters: [Category] = []
    var filteredRestaurants = Item.restaurantItem
    var filteredRestaurantsSnapshot = NSDiffableDataSourceSnapshot<Section, Item>()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.backgroundColor = .darkGray
        
        collectionView.allowsMultipleSelection = true
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
        
        filteredRestaurantsSnapshot.appendSections([.filterOption, .restaurantList])
        filteredRestaurantsSnapshot.appendItems(Item.filterItems, toSection: .filterOption)
        filteredRestaurantsSnapshot.appendItems(filteredRestaurants, toSection: .restaurantList)
        sections = filteredRestaurantsSnapshot.sectionIdentifiers
        
        dataSource.apply(filteredRestaurantsSnapshot)
    }
    
    func createLayout() -> UICollectionViewLayout{
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            let section = self.sections[sectionIndex]
            switch section{
            case .filterOption:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
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
    func backAllRestaurants(){
        filteredRestaurants = Item.restaurantItem
    }
    
    func extendRestaurants(by filterOption: Category){
        let addtional = Item.restaurantItem.filter{ $0.restaurant!.category == filterOption }
        filteredRestaurants += addtional
        filteredRestaurants = filteredRestaurants.sorted(by: <)
        
    }
    
    func reduceRestaurants(by filterOption: Category){
        filteredRestaurants = filteredRestaurants.filter{ $0.restaurant!.category == filterOption }
    }
    

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard indexPath.section == 0 else {return}
        if let cell = collectionView.cellForItem(at: indexPath) as? FilterOptionCollectionViewCell{
            cell.filterButton.backgroundColor = .black
            cell.filterButton.setTitleColor(.white, for: .normal)
            filters.append(Category.allCases[indexPath.row])
            
            switch filters.count{
                case 1:
                reduceRestaurants(by: filters.first!)
                case Category.allCases.count:
                    backAllRestaurants()
                default:
                extendRestaurants(by: filters.last!)
            }
            
            // need to change display
            dataSource.apply(filteredRestaurantsSnapshot, animatingDifferences: true)
        }
    }
    override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        guard indexPath.section == 0 else {return}
        if let cell = collectionView.cellForItem(at: indexPath) as? FilterOptionCollectionViewCell{
            cell.filterButton.backgroundColor = .white
            cell.filterButton.setTitleColor(.black, for: .normal)
            filters = filters.filter{ $0 != Category.allCases[indexPath.row]}
         
            if filters.count == 0 {
                backAllRestaurants()
            }else{
                reduceRestaurants(by: Category.allCases[indexPath.row])
            }
            
            // need to change display
            dataSource.apply(filteredRestaurantsSnapshot, animatingDifferences: true)
        }
    }
}
