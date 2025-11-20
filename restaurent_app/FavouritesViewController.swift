//
//  FavouritesViewController.swift
//  restaurent_app
//
//  Created by SDC-USER on 20/11/25.
//

import UIKit

class FavouritesViewController: UIViewController {
    /*
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.restaurants.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "favourite_cell", for: indexPath)
        
        //If downcasting fails
        guard let restaurantCell = cell as? FavouritesCollectionViewCell else {
            return cell
        }
        
        let restaurant = self.restaurants[indexPath.row]
        
        restaurantCell.configureCell(restaurant: restaurant)
        
        return cell
    }
     */
    

    
    @IBOutlet weak var favouritesCollectionView: UICollectionView!
    
    var cuisineType: CuisineType?
    var favouriteRestaurants: [Restaurant] = []
    
    var dataStore : DataStore = DataStore.shared
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.favouriteRestaurants = dataStore.getFavouriteRestaurants()
        
        if let flowLayout = favouritesCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = .zero
            flowLayout.itemSize = CGSize(width: self.view.frame.width, height: 200)
        }
        
        //let layout = generateLayout()
        
        //set layout for collection view
        //favouritesCollectionView.setCollectionViewLayout(layout, animated: true)
        
        
        //tell the collection view who the data source is
        favouritesCollectionView.dataSource = self
    }
    
    /*
     func generateLayout() -> UICollectionViewLayout {
        
        //define the size of the compositional layout item
        let size = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.5),
            heightDimension: .fractionalHeight(1.0)
        )
        
        //create item using size
        let item = NSCollectionLayoutItem(layoutSize: size)
        
        //create size of the group
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(200)
        )
        
        //create the group
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        //add spacing between the items of the group
        group.interItemSpacing = .fixed(10)
        
        let section = NSCollectionLayoutSection(group: group)
        
        //add spacing between the horizontal groups
        section.interGroupSpacing = 20
        
        //give padding to the sections
        section.contentInsets = NSDirectionalEdgeInsets(
            top: 0,
            leading: 10,
            bottom: 0,
            trailing: 10
        )
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
        
    }
     */
    
    
    
}

extension FavouritesViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.favouriteRestaurants.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "favourite_cell", for: indexPath)
        
        //If downcasting fails
        guard let restaurantCell = cell as? FavouritesCollectionViewCell else {
            return cell
        }
        
        let restaurant = self.favouriteRestaurants[indexPath.row]
        
        restaurantCell.configureCell(restaurant: restaurant)
        
        return cell
    }
}
