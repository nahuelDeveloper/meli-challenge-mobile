//
//  ProductsView.swift
//  Meli Challenge
//
//  Created by Nahuel Jose Roldan on 09/04/2024.
//

import SwiftUI
import Combine

struct ProductsView: View {
    @ObservedObject var viewModel: ProductsViewModel
        
    let selectProductAction = PassthroughSubject<Item, Never>()
    
    var body: some View {
        content
            .navigationTitle(viewModel.title)
            .navigationBarTitleDisplayMode(.inline)
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
                    NavigationLink(product.title) {
                        createProductDetailView(product: product)
                    }
                }
            }.eraseToAnyView()
        }
    }
    
    private func createProductDetailView(product: Item) -> some View {
        return ProductDetailView(viewModel: ProductDetailViewModel(product: product))
    }
}

#Preview {
    ProductsView(viewModel: ProductsViewModel(productsService: ProductsService(),
                                              title: "Search text"))
}
