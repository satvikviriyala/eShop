//
//  eShopApp.swift
//  eShop
//
//  Created by Satvik Viriyala on 20/04/24.
//

import SwiftUI

@main
struct eShopApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                CategoriesView()
                    .tabItem {
                        Label("Categories", systemImage: "square.grid.2x2")
                    }
                NotificationsView()
                    .tabItem {
                        Label("Notifications", systemImage: "bell")
                    }
                AccountView()
                    .tabItem {
                        Label("Account", systemImage: "person")
                    }
                CartView()
                    .tabItem {
                        Label("Cart", systemImage: "cart")
                    }
            }
        }
    }
}
