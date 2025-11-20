//
//  CusinieCollectionViewCell.swift
//  restaurent_app
//
//  Created by SDC-USER on 20/11/25.
//

import UIKit

class CuisineCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cusinieNameLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    func configureCell(restaurant: Restaurant) {
        imageView.image = UIImage(named: restaurant.images.first ?? "")     //first image of the images array. if first value is nil then use "". Nil colalesing
        
        imageView.layer.cornerRadius = 8.0
        imageView.clipsToBounds = true
        
        cusinieNameLabel.text = restaurant.name
    }
}
