//
//  ProductsView.swift
//  Meli Challenge
//
//  Created by Nahuel Jose Roldan on 09/04/2024.
//

import SwiftUI
import Combine

let products = ["Producto 1", "Producto 2", "Producto 3"]

struct ProductsView: View {
//    @EnvironmentObject private var appCoordinator: AppCoordinator
    
    var pepe = ""
    
    let selectProductAction = PassthroughSubject<String, Never>()
    
    var body: some View {
        List {
            ForEach(products, id: \.self) { product in
                Button {
                    print("select product")
                    selectProductAction.send(product)
                } label: {
                    Text(product)
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
