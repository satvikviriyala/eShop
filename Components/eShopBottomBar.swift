//
//  eShopBottomBar.swift
//  eShop
//
//  Created by Satvik Viriyala on 20/04/24.
//

import Foundation
import SwiftUI

// eShopBottomBar.swift

struct eShopBottomBar: View {    var selectedTab: Int
    let tabs: [BottomBarItem]

    var body: some View {
        HStack {
            ForEach(tabs.indices, id: \.self) { index in
                BottomBarItemView(item: tabs[index], isSelected: index == selectedTab) {
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.white)
    }
}

// BottomBarItem.swift (Data Model)

struct BottomBarItem: Identifiable {
    let id = UUID()
    let title: String
    let iconName: String
    var notificationCount: Int = 0
}

// BottomBarItemView.swift

struct BottomBarItemView: View {
    let item: BottomBarItem
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack(spacing: 2) {
                ZStack {
                    Image(systemName: item.iconName)
                        .font(.headline)
                    if item.notificationCount > 0 {
                        Text("\(item.notificationCount)")
                            .font(.caption2.bold())
                            .foregroundColor(.white)
                            .padding(5)
                            .background(Color.red)
                            .clipShape(Circle())
                            .offset(x: 12, y: -8)
                    }
                }
                Text(item.title)
                    .font(.caption2)
                    .fontWeight(isSelected ? .bold : .regular)
            }
            .foregroundColor(.gray)
            .padding(.horizontal, 8)
        }
    }
}
