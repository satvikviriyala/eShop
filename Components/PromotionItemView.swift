//
//  PromotionItemView.swift
//  eShop
//
//  Created by Satvik Viriyala on 20/04/24.
//

import Foundation
import SwiftUI

struct PromotionItemView: View {
    let imageName: String
    let title: String
    let subtitle: String

    var body: some View {
        VStack(alignment: .leading) {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 150, height: 80)
                .clipped()
                .cornerRadius(10)
            Text(title)
                .font(.headline)
                .lineLimit(1)
            Text(subtitle)
                .font(.subheadline)
                .foregroundColor(.gray)
                .lineLimit(1)
        }
        .padding()
        .frame(width: 170)
        .cornerRadius(15)
        .shadow(radius: 3)
    }
}


