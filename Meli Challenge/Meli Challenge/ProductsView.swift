//
//  ProductsView.swift
//  Meli Challenge
//
//  Created by Nahuel Jose Roldan on 09/04/2024.
//

import SwiftUI
import Combine

struct ProductsView: View {
//    @EnvironmentObject private var appCoordinator: AppCoordinator
    
    var pepe = ""
    
    let selectProductAction = PassthroughSubject<Product, Never>()
    
    var body: some View {
        List {
            ForEach(Model.products, id: \.id) { product in
                Button {
                    print("select product")
                    selectProductAction.send(product)
                } label: {
                    Text(product.name)
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
