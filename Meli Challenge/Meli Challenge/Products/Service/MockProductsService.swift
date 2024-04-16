//
//  MockProductsService.swift
//  Meli Challenge
//
//  Created by Nahuel Jose Roldan on 16/04/2024.
//

import Foundation
import Combine

/// Mock implementation of **ProductsServicing**. Used for tests.
class MockProductsService: ProductsServicing {
    
    func fetchItems(searchText: String) -> AnyPublisher<[Product], Error> {
        let items = Bundle.main.decode([Product].self, from: "mock_items.json")
        return Just(items)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
