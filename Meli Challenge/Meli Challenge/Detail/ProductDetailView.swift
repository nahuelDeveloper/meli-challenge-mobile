//
//  ProductDetailView.swift
//  Meli Challenge
//
//  Created by Nahuel Jose Roldan on 09/04/2024.
//

import SwiftUI

struct ProductDetailView: View {
    let viewModel = ProductDetailViewModel()
    
    var body: some View {
        Spacer()
        VStack(spacing: 20) {
            VStack {
                Text(viewModel.product.name)
                    .font(.title)
                Text(viewModel.product.description)
                    .font(.subheadline)
            }
            Image(systemName: "car.fill")
                .font(.system(size: 220))
            Text("$\(viewModel.product.price)")
                .font(.system(.largeTitle))
        }
        Spacer()
        Spacer()
        Spacer()
        Spacer()
    }
}

#Preview {
    ProductDetailView()
}
