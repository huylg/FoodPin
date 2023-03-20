//
//  FullImageROw.swift
//  FoodPin
//
//  Created by Ly Gia Huy on 19/03/2023.
//

import SwiftUI

struct FullImageRow: View {
    @State private var showError = false
    @Binding var restaurant: Restaurant

    var body: some View {
        VStack(alignment: .leading, content: {
            
            Image(restaurant.image)
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .cornerRadius(20)
                
            VStack(alignment: .leading, content: {
                HStack {
                    Text(restaurant.name)
                    if restaurant.isFavorite {
                        Spacer()
                        Image(systemName: "heart.fill")
                            .foregroundColor(.yellow)
                    }
                }
                Text(restaurant.type)
                    .font(.system(.body, design: .rounded))
                Text(restaurant.location)
                    .font(.system(.subheadline, design: .rounded))
                    .foregroundColor(.gray)
            })
            .padding(.horizontal)
            .padding(.bottom)
        })
        .swipeActions(edge: .leading,
                      allowsFullSwipe: false,
                      content: {
            Button {
            } label: {
                Image(systemName: "heart")
            }
            .tint(.green)
            
            Button {
            } label: {
                Image(systemName: "square.and.arrow.up")
            }
            .tint(.orange)
        })
        .alert(isPresented: $showError, content: {
            Alert(title: Text("Not a Avaliable"), primaryButton: .default(Text("OK")), secondaryButton: .cancel())
        })
        .contextMenu {
            
            Button {
                showError.toggle()
            } label: {
                HStack {
                    Text("Reserve a table")
                    Image(systemName: "phone")
                }
            }
            Button {
                restaurant.isFavorite.toggle()
            } label: {
                HStack {
                    Text(restaurant.isFavorite ? "Remove from favorites" : "Mark as favorite")
                    Image(systemName: "heart")
                }
            }

        }
    }
}

struct FullImageRow_Preview: PreviewProvider {
    static var previews: some View {
        
        RestaurantListView()
    
    }
}
