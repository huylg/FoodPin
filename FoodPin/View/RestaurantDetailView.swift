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
    
    @State private var showReview = false
    
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
                                
                            HStack(alignment: .bottom, content: {
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
                                
                                if let rating = restaurant.rating {
                                    Image(rating.image)
                                        .resizable()
                                        .frame(width: 60, height: 60)
                                        .padding([.bottom, .trailing])
                                        .transition(.scale)
                                }
                            
                            })
                            .animation(.spring(response: 0.2, dampingFraction: 0.3, blendDuration: 0.3), value: restaurant.rating)
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
            
            NavigationLink(destination: {
                MapView(location: restaurant.location)
                    .edgesIgnoringSafeArea(.all)
            }, label: {
                MapView(location: restaurant.location)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(height: 200)
                    .cornerRadius(20)
                    .padding()
            })
            
            Button {
                showReview.toggle()
            } label: {
                Text("Rate it")
                    .font(.system(.headline, design: .rounded))
                    .frame(minWidth: 0, maxWidth: .infinity)
            }
            .tint(Color("NavigationBarTitle"))
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.roundedRectangle(radius: 25))
            .controlSize(.large)
            .padding(.horizontal)
            .padding(.bottom, 20)

            
            
        })
        .navigationBarBackButtonHidden(true)
        .toolbar {
            showReview
            ? nil
            : ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Text("\(Image(systemName: "chevron.left"))")
                }
                
            }
        }
        .ignoresSafeArea()
        .overlay(content: {
            showReview ? ZStack {
                ReviewView(restaurant: restaurant, isDisplay: $showReview)
            } : nil
        })
    }
}

struct RestaurantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let restaurant = Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "Hong Kong", phone: "323-923423", description: " Searching for great breakfast eateries and coffee? This place is for you. We open at 6:30 every morning, and close at 9 PM. We offer espresso and espresso based drink, such as capuccino, cafe latte, piccolo and many more. Come over and enjoy a great meal. ", image: "cafedeadend", isFavorite: false, rating: nil)
        NavigationView(content: {
            RestaurantDetailView(restaurant: restaurant)
        })
//        .environment(\.dynamicTypeSize, .xxxLarge)
        .tint(.white)
        
    }
}
