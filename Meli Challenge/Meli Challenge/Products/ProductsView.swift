//
//  ProductsView.swift
//  Meli Challenge
//
//  Created by Nahuel Jose Roldan on 09/04/2024.
//

import SwiftUI
import Combine

/// Displays a list of products based on the text searched by the user in **ProductSearchView**.
struct ProductsView: View {
    @ObservedObject var viewModel: ProductsViewModel
        
    let selectProductAction = PassthroughSubject<Product, Never>()
    
    var body: some View {
        content
            .navigationTitle(viewModel.title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbarViewModifier()
            .onFirstAppear { viewModel.loadItems() }
    }
    
    private var content: some View {
        switch viewModel.state {
        case .idle:
            return Color.clear.eraseToAnyView()
        case .loading:
            return Spinner(isAnimating: true, style: .large).eraseToAnyView()
        case .loaded:
            return List {
                ForEach(viewModel.products) { product in
                    NavigationLink {
                        createProductDetailView(product: product)
                    } label: {
                        HStack(spacing: 20) {
                            createProductImageView(url: product.thumbnailURL)
                            Text(product.title)
                        }
                    }
                }
            }.eraseToAnyView()
        }
    }
    
    private func createProductImageView(url: URL) -> some View {
        AsyncImage(url: url) { image in
            image.resizable()
        } placeholder: {
            Spinner(isAnimating: true, style: .medium)
        }
        .frame(width: 80, height: 80)
    }
    
    private func createProductDetailView(product: Product) -> some View {
        return ProductDetailView(viewModel: ProductDetailViewModel(product: product))
    }
}

#Preview {
    ProductsView(viewModel: ProductsViewModel(productsService: ProductsService(),
                                              title: "Search text"))
}
