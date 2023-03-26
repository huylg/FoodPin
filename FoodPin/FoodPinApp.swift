//
//  FoodPinApp.swift
//  FoodPin
//
//  Created by Ly Gia Huy on 18/03/2023.
//

import SwiftUI

@main
struct FoodPinApp: App {
    var body: some Scene {
        WindowGroup {
            RestaurantListView()
        }
    }
    
    init() {
        let navBarAppearance = UINavigationBarAppearance()
        let color = UIColor(named: "NavigationBarTitle")!
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: color, .font: UIFont(name: "ArialRoundedMTBold", size: 35)!]
        navBarAppearance.titleTextAttributes = [.foregroundColor: color, .font: UIFont(name: "ArialRoundedMTBold", size: 20)!]
        navBarAppearance.backgroundColor = .clear
        navBarAppearance.backgroundEffect = .none
        navBarAppearance.shadowColor = .clear
        
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        UINavigationBar.appearance().compactAppearance = navBarAppearance
    }
}
