//
//  AccountView.swift
//  eShop
//
//  Created by Satvik Viriyala on 20/04/24.
//

import Foundation
import SwiftUI

struct AccountView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    // User Profile Header
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Hey! Satvik Viriyala")
                                .font(.title2).bold()
                            Text("Premium member")
                                .font(.subheadline)
                        }
                        Spacer()                    }
                    .padding()

                    // Account Options
                    AccountOptionGroup(title: "", options: [
                        AccountOption(title: "Orders", subtitle: "Track your orders", iconName: "cube.box"),
                        AccountOption(title: "Wishlist", subtitle: "Your saved items", iconName: "heart"),
                        AccountOption(title: "Coupons", subtitle: "Your available discounts", iconName: "gift"),
                        AccountOption(title: "Help Center", subtitle: "Get support", iconName: "headphones")
                    ])                    .padding(.horizontal)

                    

                    // Sponsored Ads (Horizontally Scrollable)
                    VStack(alignment: .leading) {
                        Text("Sponsored Partners")
                            .font(.title2).bold()
                            .padding(.horizontal)

                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 15) {
                                SponsoredAdView(imageName: "UPI", title: "Switch To UPI", subtitle: "Apply Now")
                                SponsoredAdView(imageName: "Delivery", title: "No Delivery Fee", subtitle: "Order Now")
                                SponsoredAdView(imageName: "Debit", title: "2 % Cashback", subtitle: "Start Now")
                        
                            }
                            .padding(.horizontal)
                        }
                    }
                    .padding(.bottom)
                }
            }
            .navigationTitle("Account")
            .navigationBarHidden(true)
        }
    }
}


struct AccountOptionGroup: View {
    let title: String
    let options: [AccountOption]

    var body: some View {
        VStack(alignment: .leading) {
            if !title.isEmpty {
                Text(title)
                    .font(.headline)
                    .padding(.vertical, 8)
            }
            ForEach(options) { option in
                NavigationLink(destination: Text("Destination")) {
                    AccountOptionRow(option: option)
                }
            }
        }
    }
}

// Account Option Row View
struct AccountOptionRow: View {
    let option: AccountOption

    var body: some View {
        HStack {
            Image(systemName: option.iconName)
                .font(.headline)
                .frame(width: 30)
            VStack(alignment: .leading) {
                Text(option.title)
                    .font(.headline)
                if let subtitle = option.subtitle {
                    Text(subtitle)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding(.vertical, 8)
    }
}

// Sponsored Ad View
struct SponsoredAdView: View {
    let imageName: String
    let title: String
    let subtitle: String

    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 150, height: 150)
                .clipped()
                .cornerRadius(10)
            Text(title)
                .font(.headline)
            Text(subtitle)
                .font(.subheadline)
        }
        .frame(width: 150)
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
    }
}

// Data Models
struct AccountOption: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String?
    let iconName: String
}


struct CategoriesView_AccountView: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
