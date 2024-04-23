//
//  BannerView.swift
//  eShop
//
//  Created by Satvik Viriyala on 20/04/24.
//

import Foundation
import SwiftUI

struct BannerView: View {
    let imageName: String
    var action: (() -> Void)? = nil

    var body: some View {
        Button(action: {
            if let action = action {
                action()
            }
        }) {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .cornerRadius(10) 
        }
    }
}
