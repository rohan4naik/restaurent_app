//
//  RestaurantCollectionViewCell.swift
//  restaurent_app
//
//  Created by SDC-USER on 19/11/25.
//

import UIKit

class RestaurantCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var restaurantNameLabel: UILabel!
    
    func configureCell(restaurant: Restaurant) {
        imageView.image = UIImage(named: restaurant.images.first ?? "")     //first image of the images array. if first value is nil then use "". Nil colalesing
        
        imageView.layer.cornerRadius = 8.0
        imageView.clipsToBounds = true
        
        restaurantNameLabel.text = restaurant.name
    }
}
