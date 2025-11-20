//
//  ViewController.swift
//  restaurent_app
//
//  Created by SDC-USER on 19/11/25.
//

import UIKit

class RestaurantViewController: UIViewController, UICollectionViewDataSource {
    
    var dataStore = DataStore.shared
    var cuisineType: CuisineType?
    var restaurants: [Restaurant] = []
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        //return count of restaurants
        self.restaurants.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //Create the cell
        //also have to downcast it to the cell class
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "restaurant_cell", for: indexPath)
        
        //If downcasting fails
        guard let restaurantCell = cell as? RestaurantCollectionViewCell else {
            return cell
        }
        
        let restaurant = self.restaurants[indexPath.row]
        
        restaurantCell.configureCell(restaurant: restaurant)
        
        return cell
    }
    

    @IBOutlet weak var restaurantCollectionView: UICollectionView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let cuisineType = self.cuisineType else {
            return
        }
        self.restaurants = dataStore.getRestaurants(for: cuisineType)
        
        // Do any additional setup after loading the view.
        //dataStore.getRestaurants()
        
        //Downcast the UICollectionViewLayout to UICollectionViewFlowLayout
//        if let flowLayout = restaurantCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
//            
//            //incase if we want to use item size property you have to disable self sizing
//            flowLayout.estimatedItemSize = .zero
//            
//            //set the item size for flow layout
//            flowLayout.itemSize = CGSize(width: view.frame.width, height: 200)
        
        
        
            
//      }
    
    // Compositional Layout
    
        let layout = generateLayout()
        
        //set layout for collection view
        restaurantCollectionView.setCollectionViewLayout(layout, animated: true)
        
//        restaurantCollectionView.contentInset = UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 25)
        
        
        //tell the collection view who the data source is
        restaurantCollectionView.dataSource = self
            
    }
    
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
    

}






