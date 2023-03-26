//
//  Restaurant.swift
//  FoodPin
//
//  Created by Ly Gia Huy on 19/03/2023.
//

import Foundation
import Combine

class Restaurant: ObservableObject {

    @Published var name: String
    @Published var type: String
    @Published var location: String
    @Published var phone: String
    @Published var description: String
    @Published var image: String
    @Published var isFavorite: Bool = false
    @Published var rating: Rating?

    init(name: String, type: String, location: String, phone: String, description: String, image: String, isFavorite: Bool, rating: Rating?) {
        self.image = image
        self.name = name
        self.location = location
        self.phone = phone
        self.description = description
        self.type = type
        self.isFavorite = isFavorite
        self.rating = rating
    }
    
    enum Rating: String, CaseIterable {
        case awesome = "awesome"
        case good = "good"
        case okay = "okay"
        case bad = "bad"
        case terrible = "terrible"
        
        var image: String {
            switch self {
            case .awesome:
                return "love"
            case .good:
                return "cool"
            case .okay:
                return "happy"
            case .bad:
                return "sad"
            case .terrible:
                return "angry"
            }
        }
    }
    
}

