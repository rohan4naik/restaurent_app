//
//  model.swift
//  restaurent_app
//
//  Created by SDC-USER on 19/11/25.
//

import Foundation

struct Location{
    var latitude : Double
    var longitude : Double
}

enum CuisineType  : String, CaseIterable{
    case chinese , italian , japanese , thailendese , indian , french , british , korean
    
    var imageName: String {
        switch self {
            case .british: return "british"
            case .chinese: return "chinese"
            case .indian: return "indian"
            case .korean: return "korean"
            case .french: return "french"
            case .italian: return "italian"
            case .japanese: return "japanese"
            case .thailendese: return "thailendese"
        }
    }
}

struct Restaurant{
    var id : UUID
    var name : String
    var location : Location
    var address : String
    var rating : Double
    var reviews : [String]
    var images : [String]
    var cuisine : [CuisineType]
    var isFavourite: Bool = true
}


