//
//  ProductsView.swift
//  Meli Challenge
//
//  Created by Nahuel Jose Roldan on 09/04/2024.
//

import SwiftUI

let products = ["Producto 1", "Producto 2", "Producto 3"]

struct ProductsView: View {
    var body: some View {
        NavigationStack {
            List {
                ForEach(products, id: \.self) { product in
                    Text(product)
                }
            }
            // TODO: show search text from ProductSearchView.
            .navigationTitle("Search text")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ProductsView()
}
