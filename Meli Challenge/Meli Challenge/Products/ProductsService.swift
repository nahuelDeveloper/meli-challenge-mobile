//
//  ProductsService.swift
//  Meli Challenge
//
//  Created by Nahuel Jose Roldan on 11/04/2024.
//

import Foundation

protocol ProductsServicing {
    func fetchItems() -> [Item]
}

class ProductsService: ProductsServicing {
    // TODO: Implement with real API
    func fetchItems() -> [Item] {
        return []
    }
}

class MockProductsService: ProductsServicing {
    
    func fetchItems() -> [Item] {
        return [Item(id: UUID(), title: "Producto 1", description: "This is a product", price: 100.0),
                Item(id: UUID(), title: "Producto 2", description: "This is a product", price: 50.0),
                Item(id: UUID(), title: "Producto 3", description: "This is a product", price: 300.0)]
    }
}
