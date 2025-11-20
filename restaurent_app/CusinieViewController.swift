//
//  CusinieViewController.swift
//  restaurent_app
//
//  Created by SDC-USER on 20/11/25.
//

import UIKit

class CusinieViewController: UIViewController, UICollectionViewDataSource {
    
    
    
    var cuisines: [CuisineType] = CuisineType.allCases          //gets the entire array of cuisine types from the enum, just that enum has to be case iterable
    
    @IBOutlet weak var cuisineCollectionView: UICollectionView!
    
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cuisineCollectionView.dataSource = self
        // Do any additional setup after loading the view.
        
        if let flowLayout = cuisineCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = .zero
            flowLayout.itemSize = CGSize(width: self.view.frame.width, height: 200)
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cuisines.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cuisine_cell", for: indexPath) as! CuisineCollectionViewCell
        
        let cuisine = cuisines[indexPath.row]
        
        cell.cusinieNameLabel.text = cuisine.rawValue
        
        //cell.imageView.image = UIImage(named: cuisine.rawValue)         //So if the file name of the image is the same as the cuisine name, then the image will show up otherwise it wont
        
        
        cell.imageView.image = UIImage(named: cuisine.imageName)        //we made a switch case variable inside the enum and called "imageName", so we are using cuisine.imageName.
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        /*
        if let selectedIndexPaths =
            cuisineCollectionView.indexPathsForSelectedItems {
            if let selectedIndexPath = selectedIndexPaths.first {
                
                let cuisine = cuisines[selectedIndexPath.row]
                print("selected \(cuisine)")
            }
        }
         */
        
        guard let selectedIndexPaths = cuisineCollectionView.indexPathsForSelectedItems else {
            return
        }
        
        guard let selectedIndexPath = selectedIndexPaths.first else {
            return
        }
        
        let cuisine = cuisines[selectedIndexPath.row]
        
        print("selected \(cuisine)")
        
        
        guard let restaurantVC = segue.destination as? RestaurantViewController else {
            return
        }
        
        restaurantVC.cuisineType = cuisine
        
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
