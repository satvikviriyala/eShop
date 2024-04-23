//
//  NotificationsView.swift
//  eShop
//
//  Created by Satvik Viriyala on 20/04/24.
//

import Foundation
import SwiftUI

struct NotificationsView: View {

    let notifications = [
        NotificationItem(title: "Best selling Data Cards!",
                         subtitle: "UPTO 80% OFF By Huawei, Jio, Airtel & More...",
                         imageName: "DataCardImage",
                         timeAgo: "10 hours ago"),
        NotificationItem(title: "Bar",
                         subtitle: "Shop Now!",
                         imageName: "BarIcon",
                         timeAgo: "1 day ago"),
        NotificationItem(title: "Couldn't checkout??",
                         subtitle: "ASUS ROG Strix G15DK-R56... is waiting to be yours. Hurry, complete your order now!",
                         imageName: "LaptopImage",
                         timeAgo: "1 day ago"),
        NotificationItem(title: "Baby Conditioners Up to 15% Off",
                         subtitle: "Loreal Kids California Baby & more",
                         imageName: "BabyProductsIcon",
                         timeAgo: "2 days ago"),
     
    ]

    var body: some View {
        VStack {
        
            HStack {
                FilterButton(title: "All", isSelected: true)
                FilterButton(title: "Offers", isSelected: false)
                FilterButton(title: "Reminders", isSelected: false)
            }
            .padding(.horizontal)

    
            List(notifications) { notification in
                NotificationRow(notification: notification)
            }
            .listStyle(.plain)
        }
        .navigationTitle("Notifications (9)")
    }
}


struct FilterButton: View {
    let title: String
    let isSelected: Bool

    var body: some View {
        Button(action: {
       
        }) {
            Text(title)
                .font(.headline)
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(isSelected ? Color.blue : Color.gray.opacity(0.2))
                .foregroundColor(isSelected ? .white : .primary)
                .cornerRadius(20)
        }
    }
}


struct NotificationRow: View {
    let notification: NotificationItem

    var body: some View {
        HStack(alignment: .top) {
            Image(notification.imageName)
                .resizable()
                .frame(width: 50, height: 50)
                .cornerRadius(10)
            VStack(alignment: .leading) {
                Text(notification.title)
                    .font(.headline)
                Text(notification.subtitle)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Spacer()
                Text(notification.timeAgo)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
    }
}


struct NotificationItem: Identifiable {
    let id = UUID()
    let title: String
    let subtitle: String
    let imageName: String
    let timeAgo: String
}
