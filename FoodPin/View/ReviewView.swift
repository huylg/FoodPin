//
//  ReviewView.swift
//  FoodPin
//
//  Created by Ly Gia Huy on 23/03/2023.
//

import SwiftUI

struct ReviewView: View {
    var restaurant: Restaurant
    
    @Binding var isDisplay: Bool
        
    @State private var showRating = false

    var body: some View {
        ZStack {
           Image(restaurant.image)
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0, maxWidth: .infinity)
                .ignoresSafeArea()
            
            Color.black
                .opacity(0.6)
                .background(.ultraThinMaterial)
                .ignoresSafeArea()
            
            HStack {
                Spacer()
                
                VStack {
                    Button {
                        withAnimation(.easeOut(duration: 0.3)) {
                            isDisplay.toggle()
                        }
                    } label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 30.0))
                            .foregroundColor(.white)
                            .padding()
                    }
                    
                    Spacer()
                }
            }
            
            VStack(alignment: .leading) {
                
                
                let ratings = Array(zip(Restaurant.Rating.allCases.indices, Restaurant.Rating.allCases))
                
                ForEach(ratings,id: \.1) { index, rating in
                    
                    HStack {
                        Image(rating.image)
                        Text(rating.image)
                            .font(.system(.title,design: .rounded))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    .animation(.easeOut.delay(Double(index) * 0.05), value: showRating)
                    .onTapGesture {
                        self.restaurant.rating = rating
                        self.isDisplay.toggle()
                    }
                }
                .opacity(showRating ? 1.0 : 0.0)
                .offset(x: showRating ? 0 : 1000)
            }
        }
        .navigationBarBackButtonHidden(true)
        .onAppear{
            showRating.toggle()
        }
    }
}

struct ReviewView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewView(restaurant: Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "G/F, 72 Po Hing Fong, Sheung Wan, Hong Kong", phone: "232-923423", description: "Searching for great breakfast eateries and coffee? This place is for you. We open at 6:30 every morning, and close at 9 PM. We offer espresso and espresso based drink, such as capuccino, cafe latte, piccolo and many more. Come over and enjoy a great meal.", image: "cafedeadend", isFavorite: true, rating: nil), isDisplay: .constant(true))
    }
}
