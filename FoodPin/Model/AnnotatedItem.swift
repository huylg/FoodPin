//
//  AnnotatedItem.swift
//  FoodPin
//
//  Created by Ly Gia Huy on 23/03/2023.
//

import Foundation
import CoreLocation

struct AnnotatedItem: Identifiable {
    let id = UUID()
    var coordinate: CLLocationCoordinate2D
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
}
