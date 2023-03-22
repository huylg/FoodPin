//
//  ContentView.swift
//  FoodPin
//
//  Created by Ly Gia Huy on 18/03/2023.
//

import SwiftUI

struct RestaurantListView: View {
    @State var restaurants = [
        Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "Hong Kong", phone: "323-923423", description: " Searching for great breakfast eateries and coffee? This place is for you. We open at 6:30 every morning, and close at 9 PM. We offer espresso and espresso based drink, such as capuccino, cafe latte, piccolo and many more. Come over and enjoy a great meal. ", image: "cafedeadend", isFavorite: false),
        Restaurant(name: "Homei", type: "Cafe", location: "Hong Kong", phone: "348-233-423", description: " A little gem hidden at the corner of the street is nothing but fantastic! This place is warm and cozy. We open at 7 every morning except Sunday, and close at 9 PM. We offer a variety of coffee drinks and specia lties including lattes, cappuccinos, teas, and more. We serve breakfast, l unch, and dinner in an airy open setting. Come over, have a coffee and enj oy a chit-chat with our baristas. ", image: "homei", isFavorite: false),
        Restaurant(name: "Teakha", type: "Tea House", location: "Hong Kong", phone: "", description: "", image: "teakha", isFavorite: false),
        Restaurant(name: "Cafe loisl", type: "Austrian / Causual Drink", location: "Hong Kong", phone: "", description: "", image: "cafeloisl", isFavorite: false),
        Restaurant(name: "Petite Oyster", type: "French", location: "Hong Kong", phone: "", description: "", image: "petiteoyster", isFavorite: false),
        Restaurant(name: "For Kee Restaurant", type: "Bakery", location: "Hong Kong", phone: "", description: "", image: "forkee", isFavorite: false),
        Restaurant(name: "Po's Atelier", type: "Bakery", location: "Hong Kong", phone: "", description: "", image: "posatelier", isFavorite: false),
        Restaurant(name: "Bourke Street Backery", type: "Chocolate", location: "Sydney", phone: "", description: "", image: "bourkestreetbakery", isFavorite: false),
        Restaurant(name: "Haigh's Chocolate", type: "Cafe", location: "Sydney", phone: "", description: "", image: "haigh", isFavorite: false),
        Restaurant(name: "Palomino Espresso", type: "American / Seafood", location: "Sydney", phone: "", description: "", image: "palomino", isFavorite: false),
        Restaurant(name: "Upstate", type: "American", location: "New York", phone: "", description: "", image: "upstate", isFavorite: false),
        Restaurant(name: "Traif", type: "American", location: "New York", phone: "", description: "", image: "traif", isFavorite: false),
        Restaurant(name: "Graham Avenue Meats", type: "Breakfast & Brunch", location: "New York", phone: "", description: "", image: "graham", isFavorite: false),
        Restaurant(name: "Waffle & Wolf", type: "Coffee & Tea", location: "New York", phone: "", description: "", image: "waffleandwolf", isFavorite: false),
        Restaurant(name: "Five Leaves", type: "Coffee & Tea", location: "New York", phone: "", description: "", image: "fiveleaves", isFavorite: false),
        Restaurant(name: "Cafe Lore", type: "Latin American", location: "New York", phone: "", description: "", image: "cafelore", isFavorite: false),
        Restaurant(name: "Confessional", type: "Spanish", location: "New York", phone: "", description: "", image: "confessional", isFavorite: false),
        Restaurant(name: "Barrafina", type: "Spanish", location: "London", phone: "", description: "", image: "barrafina", isFavorite: false),
        Restaurant(name: "Donostia", type: "Spanish", location: "London", phone: "", description: "", image: "donostia", isFavorite: false),
        Restaurant(name: "Royal Oak", type: "British", location: "London", phone: "", description: "", image: "royaloak", isFavorite: false),
        Restaurant(name: "CASK Pub and Kitchen", type: "Thai", location: "London", phone: "", description: "", image: "cask", isFavorite: false),
    ]

    var body: some View {
        NavigationView {
            List {
                ForEach($restaurants, id: \.name) { $restaurant in
                    NavigationLink(destination: {
                        RestaurantDetailView(restaurant: restaurant)
                    }, label: {
                        BasicTextImageRow(restaurant: $restaurant)
                    })
                }
                .onDelete { index in
                    restaurants.remove(atOffsets: index)
                }
            }
            .listStyle(.plain)
            .listRowSeparator(.hidden)
            .navigationTitle("FoodPin")
        }
        .tint(.white)
    }
}

struct RestaurantListView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantListView()
    }
}
