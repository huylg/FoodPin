//
//  MapView.swift
//  FoodPin
//
//  Created by Ly Gia Huy on 23/03/2023.
//

import SwiftUI
import MapKit

struct MapView: View {
    let location: String
    
    @State private var annotatedItem = AnnotatedItem(coordinate: CLLocationCoordinate2D(latitude: 51.510357, longitude: -0.116773))
    
    @State private var region: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.510357, longitude: -0.116773), span: MKCoordinateSpan(latitudeDelta: 1.0, longitudeDelta: 1.0))
    
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: [annotatedItem], annotationContent: { item in
            MapMarker(coordinate: item.coordinate, tint: .red)
        })
        .task {
            convertAddress(location: location)
        }
    }
    
    private func convertAddress(location: String){
        
        let geocoder = CLGeocoder()
        
        geocoder.geocodeAddressString(location) { placemarks, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let placemarks = placemarks,
                  let location = placemarks.first?.location else {
                return
            }
            
            self.region = MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.0015, longitudeDelta: 0.0015))
            self.annotatedItem = AnnotatedItem(coordinate: location.coordinate)
        }
    
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(location: "54 Frith Street London W1D 4SL United Kingdom").edgesIgnoringSafeArea(.all)
    }
}
