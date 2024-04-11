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
        return Bundle.main.decode([Item].self, from: "mock_items.json")
    }
}
