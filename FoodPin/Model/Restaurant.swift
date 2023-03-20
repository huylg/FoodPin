//
//  Restaurant.swift
//  FoodPin
//
//  Created by Ly Gia Huy on 19/03/2023.
//

import Foundation

struct Restaurant {
    var name: String
    var type: String
    var location: String
    var phone: String
    var description: String
    var image: String
    var isFavorite: Bool

    init(name: String, type: String, location: String, phone: String, description: String, image: String, isFavorite: Bool) {
        self.image = image
        self.name = name
        self.location = location
        self.phone = phone
        self.description = description
        self.type = type
        self.isFavorite = isFavorite
    }
    
    init() {
        self.init(name: "", type: "", location: "", phone: "", description: "", image: "", isFavorite: false)
    }
    
}
