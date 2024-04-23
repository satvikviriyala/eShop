//
//  CategoriesView.swift
//  eShop
//
//  Created by Satvik Viriyala on 20/04/24.
//

//import Foundation
//
//import SwiftUI
//
//struct CategoriesView: View {
//    let categories = [
//        Category(name: "For You", imageName: "ForYouIcon"),
//        Category(name: "Grocery", imageName: "GroceryIcon"),
//        Category(name: "Fashion", imageName: "FashionIcon"),
//        Category(name: "Appliances", imageName: "AppliancesIcon"),
//        Category(name: "Mobiles", imageName: "MobilesIcon"),
//        Category(name: "Electronics", imageName: "ElectronicsIcon"),
//        Category(name: "Home", imageName: "HomeIcon"),
//        Category(name: "Furniture", imageName: "FurnitureIcon"),
//        Category(name: "Personal Care", imageName: "PersonalCareIcon"),
//
//    ]
//
//    let popularStores = [
//        PopularStore(imageName: "OfferZoneIcon", title: "OfferZone"),
//        PopularStore(imageName: "CoolingDaysIcon", title: "Super Cooling Days"),
//        PopularStore(imageName: "MobilesIcon", title: "Mobiles"),
//        PopularStore(imageName: "MakeupIcon", title: "Makeup"),
//        PopularStore(imageName: "HeadphonesIcon", title: "Bluetooth Headphones"),
//        PopularStore(imageName: "ToysIcon", title: "Toys & Games"),
//        PopularStore(imageName: "TravelIcon", title: "Travel"),
//
//    ]
//
//    let recentlyViewedStores = [
//        RecentlyViewedStore(imageName: "TowerPCIcon", title: "Tower PCs"),
//        RecentlyViewedStore(imageName: "SpeakerIcon", title: "Speakers"),
//        RecentlyViewedStore(imageName: "OtherIcon", title: "Other Products"),
//
//    ]
//
//    var body: some View {
//        ScrollView {
//            VStack(alignment: .leading) {
//                Text("All Categories")
//                    .font(.title).bold()
//                    .padding(.horizontal)
//
//                // Category List
//                ScrollView(.horizontal, showsIndicators: false) {
//                    HStack(spacing: 15) {
//                        ForEach(categories, id: \.name) { category in
//                            VStack {
//                                Image(category.imageName)
//                                    .resizable()
//                                    .frame(width: 60, height: 60)
//                                Text(category.name)
//                                    .font(.caption)
//                            }
//                        }
//                    }
//                    .padding(.horizontal)
//                }
//
//                // Popular Stores
//                VStack(alignment: .leading) {
//                    Text("Popular Store")
//                        .font(.title2).bold()
//                        .padding(.horizontal)
//                    
//                    ScrollView(.horizontal, showsIndicators: false) {
//                        HStack(spacing: 15) {
//                            ForEach(popularStores, id: \.imageName) { store in
//                                PopularStoreView(store: store)
//                            }
//                            NavigationLink(destination: Text("All Stores")) {
//                                VStack {
//                                    Image(systemName: "arrow.down")
//                                        .font(.title)
//                                    Text("View All")
//                                        .font(.caption)
//                                }
//                            }
//                        }
//                        .padding(.horizontal)
//                    }
//                }
//
//                // Recently Viewed Stores
//                VStack(alignment: .leading) {
//                    Text("Recently Viewed Stores")
//                        .font(.title2).bold()
//                        .padding(.horizontal)
//
//                    ScrollView(.horizontal, showsIndicators: false) {
//                        HStack(spacing: 15) {
//                            ForEach(recentlyViewedStores, id: \.imageName) { store in
//                                RecentlyViewedStoreView(store: store)
//                            }
//                        }
//                        .padding(.horizontal)
//                    }
//                }
//            }
//            .padding(.vertical)
//        }
//    }
//}
//
//// Data Models
//struct Category: Identifiable {
//    let id = UUID()
//    let name: String
//    let imageName: String
//}
//
//struct PopularStore: Identifiable {
//    let id = UUID()
//    let imageName: String
//    let title: String
//}
//
//struct RecentlyViewedStore: Identifiable {
//    let id = UUID()
//    let imageName: String
//    let title: String
//}
//
//// Subviews
//struct PopularStoreView: View {
//    let store: PopularStore
//
//    var body: some View {
//        VStack {
//            Image(store.imageName)
//                .resizable()
//                .frame(width: 80, height: 80)
//                .cornerRadius(10)
//            Text(store.title)
//                .font(.caption)
//        }
//    }
//}
//
//struct RecentlyViewedStoreView: View {
//    let store: RecentlyViewedStore
//
//    var body: some View {
//        VStack {
//            Image(store.imageName)
//                .resizable()
//                .frame(width: 120, height: 80)
//                .cornerRadius(10)
//            Text(store.title)
//                .font(.caption)
//        }
//    }
//}
//
//struct CategoriesView_Previews: PreviewProvider {
//    static var previews: some View {
//        CategoriesView()
//    }
//}
// old code



// new code starts from here

import SwiftUI

struct CategoriesView: View {
    let categories = [
        Category(name: "For You", imageName: "For You", products: []),
        Category(name: "Fashion", imageName: "Fashion", products: []),
        Category(name: "Appliances", imageName: "Appliances", products: []),
        Category(name: "Mobiles", imageName: "Mobiles", products: []),
        Category(name: "Electronics", imageName: "Electronics", products: []),
        Category(name: "Home", imageName: "Home", products: []),
        Category(name: "Furniture", imageName: "Furniture", products: []),
        Category(name: "Personal Care", imageName: "Personal Care", products: []),
    ]

    
    let products = [
        Product(id: 1, name: "Product A", imageName: "ProductA", price: 1999, rating: 4.5),
        Product(id: 2, name: "Product B", imageName: "ProductB", price: 2499, rating: 4.0),
        Product(id: 3, name: "Product C", imageName: "ProductC", price: 999, rating: 3.5),
    
    ]
    @State private var selectedCategory: Category? = nil
    var body: some View {
            GeometryReader { geometry in
                HStack {
                    
                    ScrollView {
                        VStack(alignment: .center) {
                                Text("All Categories")
                                    .font(.title3)
                                    .bold()
                                    .padding(.horizontal)
                                    .lineLimit(2)
                                    .minimumScaleFactor(0.5)

                            ForEach(categories, id: \.name) { category in
                                Button(action: {
                                    selectedCategory = category
                                }) {
                                    VStack {
                                        Image(category.imageName)
                                            .resizable()
                                            .frame(width: 60, height: 60)
                                        Text(category.name)
                                            .font(.caption)
                                    }
                                }
                            }
                        }
                        .frame(width: geometry.size.width / 3)
                    }

                    
                    Divider()

                    
                    ScrollView {
                        VStack(alignment: .leading) {
                            if let selectedCategory = selectedCategory {
                                Text("Products in \(selectedCategory.name)")
                                    .font(.title2).bold()
                                    .padding(.horizontal)
                                
                                ForEach(selectedCategory.products) { product in
                                    ProductCardView(product: product)
                                        .padding(.bottom, 10)
                                }
                            } else {
                                VStack {
                                    Text("Select a Category")
                                        .font(.title2).bold()
                                    .padding(.horizontal)
                                    DifferentCategoriesSecondaryView()
                                }
                                    
                            }
                        }
                        .padding(.horizontal)
                        .frame(width: geometry.size.width * 2 / 3)
                    }
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
            }
        }
    }


    struct Category: Identifiable {
        let id = UUID()
        let name: String
        let imageName: String
        var products: [Product]
    }


struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}
