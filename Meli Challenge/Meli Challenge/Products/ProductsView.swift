//
//  ProductsView.swift
//  Meli Challenge
//
//  Created by Nahuel Jose Roldan on 09/04/2024.
//

import SwiftUI
import Combine

struct ProductsView: View {
    @ObservedObject var viewModel = ProductsViewModel()
        
    let selectProductAction = PassthroughSubject<Product, Never>()
    
    var body: some View {
        List {
            ForEach($viewModel.products, id: \.id) { product in
                Button {
                    print("select product")
                    selectProductAction.send(product.wrappedValue)
                } label: {
                    Text(product.wrappedValue.name)
                }
            }
        }
        // TODO: show search text from ProductSearchView.
        .navigationTitle("Search text")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    ProductsView()
}
