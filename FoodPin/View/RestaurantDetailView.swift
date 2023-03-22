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
        ScrollView(content: {
            VStack(alignment: .leading, content: {
                Image(restaurant.image)
                    .resizable()
                    .scaledToFill()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 445)
                    .overlay {
                        VStack {
                            Image(systemName: restaurant.isFavorite ? "heart.fill" : "heart")
                                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topTrailing)
                                .padding()
                                .font(.system(size: 30))
                                .foregroundColor( restaurant.isFavorite ? .yellow : .white)
                                .padding(.top, 40)
                                
                            VStack(alignment: .leading, spacing: 5) {
                                Text(restaurant.name)
                                    .font(.custom("Nunito-Regular", size: 35, relativeTo: .largeTitle))
                                    .bold()
                                Text(restaurant.type)
                                    .font(.system(.headline, design: .rounded))
                                    .padding(.all, 5)
                                    .backgroundStyle(.black)
                            }
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottomLeading)
                            .foregroundColor(.white)
                            .padding()
                        }
                        
                    }
            })
            Text(restaurant.description)
                .padding()
                
            HStack(alignment: .top) {
                VStack(alignment: .leading, content: {
                    Text("ADDRESS")
                    Text(restaurant.location)
                })
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                
                VStack(alignment: .leading, content: {
                    Text("PHONE")
                    Text(restaurant.phone)
                })
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            }
            .padding(.horizontal)
        })
        .ignoresSafeArea()
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Text("\(Image(systemName: "chevron.left"))")
                }

            }
        }
    }
}

struct RestaurantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let restaurant = Restaurant(name: "Coffee House", type: "Coffee", location: "Vietnam", phone: " 232-923423 ", description: " Searching for great breakfast eateries and coffee? This place is for you. We open at 6:30 every morning , and close at 9 PM. We offer espresso and espresso based drink, such as c apuccino, cafe latte, piccolo and many more. Come over and enjoy a great m eal " , image: "cafedeadend", isFavorite: true)
        NavigationView(content: {
            RestaurantDetailView(restaurant: restaurant)
        })
        .tint(.white)
        
    }
}
