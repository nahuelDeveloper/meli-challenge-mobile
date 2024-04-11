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
        List {
            ForEach(viewModel.products) { product in
                NavigationLink(product.title) {
                    createProductDetailView(product: product)
                }
                // FIXME: (BUG) when user goes to Product Detail and returns, the list disappears.
//                Button {
//                    print("select product")
//                    selectProductAction.send(product)
//                } label: {
//                    Text(product.title)
//                }
            }
        }
        // TODO: show search text from ProductSearchView.
        .navigationTitle("Search text")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            viewModel.loadItems()
        }
    }
    
    private func createProductDetailView(product: Item) -> some View {
        let view = ProductDetailView(viewModel: ProductDetailViewModel(product: product))
        return view
    }
}

#Preview {
    ProductsView(viewModel: ProductsViewModel(productsService: MockProductsService()))
}
