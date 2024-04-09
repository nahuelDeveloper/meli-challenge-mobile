//
//  ProductDetailView.swift
//  Meli Challenge
//
//  Created by Nahuel Jose Roldan on 09/04/2024.
//

import SwiftUI

struct ProductDetailView: View {
    var body: some View {
        NavigationStack {
            Spacer()
            VStack(spacing: 20) {
                VStack {
                    Text("Product")
                        .font(.title)
                    Text("This is a product")
                        .font(.subheadline)
                }
                Image(systemName: "car.fill")
                    .font(.system(size: 220))
                Text("$10.000.000")
                    .font(.system(.largeTitle))
            }
            Spacer()
            Spacer()
            Spacer()
            Spacer()
        }
    }
}

#Preview {
    ProductDetailView()
}
