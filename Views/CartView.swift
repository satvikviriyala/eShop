//
//  CartView.swift
//  eShop
//
//  Created by Satvik Viriyala on 20/04/24.
//

import Foundation
import SwiftUI

struct CartView: View {
    // Sample cart item data
    let cartItems = [
        CartItem(name: "Apple MMFJ3HN/A M2 Chip (8GB...",
                 imageName: "Mac",
                 originalPrice: 59900,
                 discountedPrice: 57990,
                 rating: 4,
                 numberOfRatings: 441,
                 offersApplied: 4,
                 totalOffers: 27),
        CartItem(name: "Sparx Sparx Men SS-703 Olive Yell...",
                 imageName: "Sparx",
                 originalPrice: 599,
                 discountedPrice: 499,
                 rating: 3,
                 numberOfRatings: 274,
                 offersApplied: 3,
                 totalOffers: 20),
      
    ]

    var body: some View {
        VStack {
            // Cart Header
            HStack {
                Text("My Cart")
                    .font(.title).bold()
                Spacer()
            }
            .padding()

            // Delivery Address
            HStack {
                Text("Deliver to: Satvik Vir... 533105 HOME")
                    .font(.subheadline)
                Spacer()
                Button("Change") {
                    
                }
            }
            .padding(.horizontal)

            // List of Cart Items
            ScrollView {
                VStack(spacing: 15) {
                    ForEach(cartItems) { item in
                        CartItemView(item: item)
                    }
                }
                .padding(.horizontal)
            }

            // Order Summary
            HStack {
                Text("₹58,489")
                    .font(.title2).bold()
                Spacer()
                Button("Place order") {
   
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(Color.orange)
                .foregroundColor(.white)
                .cornerRadius(5)
            }
            .padding()
        }
    }
}

// Cart Item View
struct CartItemView: View {
    let item: CartItem

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(item.imageName)
                    .resizable()
                    .frame(width: 80, height: 80)
                VStack(alignment: .leading) {
                    Text(item.name)
                        .font(.headline)
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text("(\(item.numberOfRatings))")
                            .font(.caption)
                    }
                    HStack(spacing: 5) {
                        Text("₹\(item.originalPrice)")
                            .strikethrough()
                            .foregroundColor(.gray)
                        Text("₹\(item.discountedPrice)")
                            .font(.headline)
                            .foregroundColor(.red)
                        Text("↓\(calculateDiscount(originalPrice: item.originalPrice, discountedPrice: item.discountedPrice))%")
                            .font(.headline)
                            .foregroundColor(.green)
                    }
                    Text("\(item.offersApplied) offers applied • \(item.totalOffers) offers available")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                Spacer()
            }

            HStack {
                Image(systemName: "bolt.car")
                Text("Delivery in 2 days, Thu • FREE")
                    .font(.caption)
                Spacer()
            }

            HStack {
                Button("Remove") {
                    // Handle remove item action
                }
                .buttonStyle(.bordered)
                Button("Buy later") {
                 
                }
                .buttonStyle(.bordered)
                Spacer()
                Button("Buy this now!") {
                    // Handle buy now action
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
    }

    func calculateDiscount(originalPrice: Int, discountedPrice: Int) -> Int {
        let discount = (Float(originalPrice - discountedPrice) / Float(originalPrice)) * 100
        return Int(discount.rounded())
    }
}

// Cart Item Data Model
struct CartItem: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let originalPrice: Int
    let discountedPrice: Int
    let rating: Int
    let numberOfRatings: Int
    let offersApplied: Int
    let totalOffers: Int
}
