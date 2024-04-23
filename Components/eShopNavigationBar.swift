//
//  eShopNavigationBar.swift
//  eShop
//
//  Created by Satvik Viriyala on 20/04/24.
//

import Foundation
import SwiftUI

struct eShopNavigationBar: View {
    var title: String
    var onSearch: () -> Void
    var onCart: () -> Void

    var body: some View {
        HStack {
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
            Spacer()
            Button(action: onSearch) {
                Image(systemName: "magnifyingglass")
            }
            Button(action: onCart) {
                Image(systemName: "cart")
            }
        }
        .padding(.horizontal)
        .frame(height: 60)
    }
}



