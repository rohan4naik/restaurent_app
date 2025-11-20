//
//  dataStore.swift
//  restaurent_app
//
//  Created by SDC-USER on 19/11/25.
//

import Foundation

class DataStore {
    private var restaurants: [Restaurant] = []
    
    private init(){                 //because of private, we cannot create any instances of this class.
        loadSampleData()
    }
    
    static let shared = DataStore()         //So we create an instance inside the class ourselves, we can only and only create instances inside the class
    //We do this so that all of the view controllers are accessing the same data and not different sets of data. Also do that there are not too many instances of data store created
    
    func getRestaurants(for cuisine: CuisineType)-> [Restaurant] {
        restaurants.filter { restaurant in
            //include the restaurant if the selected cuisine is in the array of cuisines served by the restaurant
            if restaurant.cuisine.contains(cuisine) {
                return true
            }
            return false
        }
    }
    
    func getFavouriteRestaurants()-> [Restaurant] {
        restaurants.filter { restaurant in
            if restaurant.isFavourite {
                return true
            }
            return false
        }
    }
    
    func makeFavourite(for restaurant: Restaurant){
        if let index = restaurants.firstIndex(where: {$0.name == restaurant.name}) {
            restaurants[index].isFavourite.toggle()
            print("FAVOURITE IS \(restaurants[index].name)")
        }
    }
    
    
    func loadSampleData() {
        let sampleData : [Restaurant] = [
            Restaurant(
                id: UUID(), name: "California Kitchen", location: Location(latitude: 0.0, longitude: 0.0), address: "Pune", rating: 5.0, reviews: [], images: ["all_american_diner_dining"], cuisine: [.chinese]
            ),
            Restaurant(
                id: UUID(), name: "French Bistro", location: Location(latitude: 0.0, longitude: 0.0), address: "Pune", rating: 4.8, reviews: [], images: ["bruschetta"], cuisine: [.french]
            ),
            Restaurant(
                id: UUID(), name: "Italian Eatery", location: Location(latitude: 0.0, longitude: 0.0), address: "Pune", rating: 4.6, reviews: [], images: ["lasagna_bolognese"], cuisine: [.italian]
            ),
            Restaurant(
                id: UUID(), name: "Mexican Delights", location: Location(latitude: 0.0, longitude: 0.0), address: "Pune", rating: 4.4, reviews: [], images: ["nachos_supreme"], cuisine: [.indian, .chinese]
            ),
            Restaurant(
                id: UUID(), name: "Vegan Paradise", location: Location(latitude: 0.0, longitude: 0.0), address: "Pune", rating: 4.2, reviews: [], images: ["paneer_tikka"], cuisine: [.indian]
            )
        ]
        
        self.restaurants = sampleData
    }
    
    func getRestaurants() -> [Restaurant] {
        return restaurants
    }
}
