//
//  BasicTextImageRow.swift
//  FoodPin
//
//  Created by Ly Gia Huy on 19/03/2023.
//

import SwiftUI

struct BasicTextImageRow: View {
    @State private var showError = false
    @State private var showOptions = false
    @Binding var restaurant: Restaurant

    var body: some View {
        HStack(alignment: .top, spacing: 20, content: {
            Image(restaurant.image)
                .resizable()
                .frame(width: 118, height: 120)
                .clipShape(RoundedRectangle(cornerRadius: 20))

            VStack(alignment: .leading, content: {
                Text(restaurant.name)
                    .font(.system(.title2, design: .rounded))
                Text(restaurant.type)
                    .font(.system(.body, design: .rounded))
                Text(restaurant.location)
                    .font(.system(.subheadline, design: .rounded))
                    .foregroundColor(.gray)
            })

            if restaurant.isFavorite {
                Spacer()
                Image(systemName: "heart.fill")
                    .foregroundColor(.yellow)
            }
        })
        .contextMenu(menuItems: {
            Button {
                showError.toggle()
            } label: {
                HStack {
                    Text("Reverse a table")
                    Image(systemName: "phone")
                }
            }
            Button {
                restaurant.isFavorite.toggle()
            } label: {
                HStack {
                    Text(restaurant.isFavorite ? "Remove from Favorite" : "Mark as Favorite")
                    Image(systemName: "heart")
                }
            }
            
            Button {
                showOptions.toggle()
            } label: {
                HStack {
                    Text("Share")
                    Image(systemName: "square.and.arrow.up")
                }
            }

        })
        .swipeActions(edge: .leading, content: {

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
        .sheet(isPresented: $showOptions, content: {
            
            let defaultText = "Just checking in at \(restaurant.name)"
            
            if let imageToShare = UIImage(named: restaurant.image){
                ActivityView(activityItems: [defaultText, imageToShare])
            }else{
                ActivityView(activityItems: [defaultText])
            }

        })
        .alert(isPresented: $showError, content: {
            Alert(title: Text("Not yet avaliable"), primaryButton: .default(Text("OK")), secondaryButton: .cancel())
        })
    }
    
}

struct BasicTextImageRow_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantListView()
    }
}
