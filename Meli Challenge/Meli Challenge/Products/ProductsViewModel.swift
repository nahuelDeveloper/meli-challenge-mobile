//
//  ProductsViewModel.swift
//  Meli Challenge
//
//  Created by Nahuel Jose Roldan on 11/04/2024.
//

import Foundation
import Combine

class ProductsViewModel: ObservableObject {
    @Published var products = [Product(id: UUID(), name: "Producto 1", description: "This is a product", price: 100.0),
                               Product(id: UUID(), name: "Producto 2", description: "This is a product", price: 50.0),
                               Product(id: UUID(), name: "Producto 3", description: "This is a product", price: 300.0)]
}
