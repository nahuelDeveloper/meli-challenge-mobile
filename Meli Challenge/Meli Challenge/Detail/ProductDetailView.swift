//
//  ProductDetailView.swift
//  Meli Challenge
//
//  Created by Nahuel Jose Roldan on 09/04/2024.
//

import SwiftUI

struct ProductDetailView: View {
    let viewModel: ProductDetailViewModel
    
    var body: some View {
        Spacer()
        VStack(spacing: 20) {
            Text(viewModel.product.title)
                .font(.title2)
            AsyncImage(url: viewModel.product.thumbnailURL) { image in
                image.resizable()
            } placeholder: {
                Spinner(isAnimating: true, style: .medium)
            }
            .frame(width: 180, height: 180)
            Text(viewModel.product.price, format: .currency(code: viewModel.currencyCode))
                .font(.title2)
        }
        .toolbarViewModifier()
        Spacer()
        Spacer()
        Spacer()
        Spacer()
    }
}

#Preview {
    ProductDetailView(viewModel: ProductDetailViewModel(
        product: Item(id: "MLA1", 
                      title: "Producto 1",
                      price: 100.0,
                      thumbnail: "http://http2.mlstatic.com/D_609155-MLA75617599150_042024-I.jpg")))
}
