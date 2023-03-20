//
//  RestaurantDetailView.swift
//  FoodPin
//
//  Created by Ly Gia Huy on 19/03/2023.
//

import SwiftUI

struct RestaurantDetailView: View {
    let restaurant: Restaurant
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack(alignment: .top, content: {
            Image(restaurant.image)
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0, maxWidth: .infinity)
                .ignoresSafeArea()
                
            Color
                .black
                .frame(height: 100)
                .opacity(0.8)
                .cornerRadius(20)
                .padding()
                .overlay {
                    VStack(spacing: 5) {
                        Text(restaurant.name)
                        Text(restaurant.type)
                        Text(restaurant.location)
                    }
                    .font(.system(.headline, design: .rounded))
                    .foregroundColor(.white)
                }
        })
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Text("\(Image(systemName: "chevron.left")) \(restaurant.name)")
                }

            }
        }
    }
}

struct RestaurantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let restaurant = Restaurant(name: "Coffee House", type: "Coffee", location: "Vietnam", phone: " 232-923423 ", description: " Searching for great breakfast eateries and coffee? This place is for you. We open at 6:30 every morning , and close at 9 PM. We offer espresso and espresso based drink, such as c apuccino, cafe latte, piccolo and many more. Come over and enjoy a great m eal " , image: "cafedeadend", isFavorite: false)
        RestaurantDetailView(restaurant: restaurant)
    }
}
