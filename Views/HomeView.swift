//
//  HomeView.swift
//  eShop
//
//  Created by Satvik Viriyala on 20/04/24.
//

import Foundation

import SwiftUI

struct HomeView: View {
    
    let products = [
        Product(id: 1, name: "Apple 2021 iMac", imageName: "iMac", price: 129990, rating: 4.5),
        Product(id: 2, name: "NIKE Court Zoom", imageName: "Nike", price: 5499, rating: 4.0),
        Product(id: 3, name: "Apple AirPods Pro", imageName: "Apple", price: 29999, rating: 4.7),
  
    ]
    
    var body: some View {
        VStack {
          
            eShopNavigationBar(title: "eShop", onSearch: {
           
            }, onCart: {
            CartView()
            })
            
            ScrollView {
                VStack(spacing: 15) {
     
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            BannerView(imageName: "Banner 1")
                            BannerView(imageName: "Banner 2")
                            BannerView(imageName: "Banner 3")
                        }
                        .padding(.horizontal)
                    }
                    
                  
                    DifferentCategoriesSecondaryView()
                    
                   
                    ScrollView(.horizontal, showsIndicators: false) {
                    
                        VStack(alignment: .leading) {
                            Text("Promotional Offers")
                                .font(.title2).bold()
                                .padding()
                            HStack(spacing: 10) {
                                PromotionItemView(imageName: "Food Delivery", title: "Free Delivery", subtitle: "on 199 and above")
                                PromotionItemView(imageName: "Housing", title: "Housing", subtitle: "starting 79lacs")
                                PromotionItemView(imageName: "The Woods", title: "Tables & Desks", subtitle: "starting at 799")
                         
                            }
                            .padding(.horizontal)
                        }
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Suggested for You")
                            .font(.title2).bold()
                            .padding()
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 10) {
                                ForEach(products, id: \.id) { product in
                                    ProductCardView(product: product)
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                }
                .padding(.bottom)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewDevice("iPhone 14 Pro")
            .previewDisplayName("Home View")
    }
}

struct DifferentCategoriesSecondaryView: View {
    let categories = [
        DifferentCategory(name: "For You", imageName: "For You"),
        DifferentCategory(name: "Fashion", imageName: "Fashion"),
        DifferentCategory(name: "Appliances", imageName: "Appliances"),
        DifferentCategory(name: "Mobiles", imageName: "Mobiles"),
        DifferentCategory(name: "Electronics", imageName: "Electronics"),
        DifferentCategory(name: "Home", imageName: "Home"),
        DifferentCategory(name: "Furniture", imageName: "Furniture"),
        DifferentCategory(name: "Personal Care", imageName: "Personal Care"),

    ]

    let popularStores = [
        PopularStore(imageName: "OfferZone", title: "OfferZone"),
        PopularStore(imageName: "Mobiles", title: "Mobiles"),
        PopularStore(imageName: "Personal Care", title: "Makeup"),
        PopularStore(imageName: "Bluetooth Headphones", title: "Bluetooth Headphones"),
        PopularStore(imageName: "Toys and Games", title: "Toys & Games"),
  
    ]

    let recentlyViewedStores = [
        RecentlyViewedStore(imageName: "Tower PCS", title: "Tower PCs"),
        RecentlyViewedStore(imageName: "Speaker", title: "Speakers"),
        RecentlyViewedStore(imageName: "Other Products", title: "Other Products"),
 
    ]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("All Categories")
                    .font(.title).bold()
                    .padding(.horizontal)

                // Category List
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        ForEach(categories, id: \.name) { category in
                            VStack {
                                Image(category.imageName)
                                    .resizable()
                                    .frame(width: 60, height: 60)
                                Text(category.name)
                                    .font(.caption)
                            }
                        }
                    }
                    .padding(.horizontal)
                }

                // Popular Stores
                VStack(alignment: .leading) {
                    Text("Popular Store")
                        .font(.title2).bold()
                        .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            ForEach(popularStores, id: \.imageName) { store in
                                PopularStoreView(store: store)
                            }
                            NavigationLink(destination: Text("All Stores")) {
                                VStack {
                                    Image(systemName: "arrow.down")
                                        .font(.title)
                                    Text("View All")
                                        .font(.caption)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }

                // Recently Viewed Stores
                VStack(alignment: .leading) {
                    Text("Recently Viewed Stores")
                        .font(.title2).bold()
                        .padding(.horizontal)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            ForEach(recentlyViewedStores, id: \.imageName) { store in
                                RecentlyViewedStoreView(store: store)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .padding(.vertical)
        }
    }
}


struct DifferentCategory: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
}

struct PopularStore: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
}

struct RecentlyViewedStore: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
}

// Subviews
struct PopularStoreView: View {
    let store: PopularStore

    var body: some View {
        VStack {
            Image(store.imageName)
                .resizable()
                .frame(width: 80, height: 80)
                .cornerRadius(10)
            Text(store.title)
                .font(.caption)
        }
    }
}

struct RecentlyViewedStoreView: View {
    let store: RecentlyViewedStore

    var body: some View {
        VStack {
            Image(store.imageName)
                .resizable()
                .frame(width: 120, height: 80)
                .cornerRadius(10)
            Text(store.title)
                .font(.caption)
        }
    }
}
