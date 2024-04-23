//
//  CategoryView.swift
//  eShop
//
//  Created by Satvik Viriyala on 20/04/24.
//

import Foundation
import SwiftUI

struct CategoryView: View {
    let category: Category

    var body: some View {
        VStack {
            Image(category.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 70, height: 70)
                .cornerRadius(10) 
            Text(category.name)
                .font(.caption)
                .multilineTextAlignment(.center)
        }
    }
}

