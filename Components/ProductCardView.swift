//
//  ProductCardView.swift
//  eShop
//
//  Created by Satvik Viriyala on 20/04/24.
//

import Foundation
import SwiftUI

struct Product: Identifiable {
    let id: Int
    let name: String
    let imageName: String
    let price: Int
    let rating: Double
    
}

struct ProductCardView: View {
    let product: Product

    var body: some View {
        VStack(alignment: .leading) {
            Image(product.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
            Text(product.name)
                .font(.headline)
                .lineLimit(2) 
            HStack {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                Text("\(String(format: "%.1f", product.rating))")
            }
            Text("₹\(product.price)")
                .font(.subheadline)
                .fontWeight(.bold)
        }
        .padding()
        .frame(width: 180)
        .cornerRadius(15)
        .shadow(radius: 5)
    }
}


