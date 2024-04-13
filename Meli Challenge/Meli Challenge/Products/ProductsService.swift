//
//  ProductsService.swift
//  Meli Challenge
//
//  Created by Nahuel Jose Roldan on 11/04/2024.
//

import Foundation
import Combine

protocol ProductsServicing {
    func fetchItems(searchText: String) -> AnyPublisher<[Item], Error>
}

class ProductsService: BaseService, ProductsServicing {
    
    func fetchItems(searchText: String) -> AnyPublisher<[Item], Error> {
        let url = baseURL
            .appending(path: "search")
            .appending(queryItems: [URLQueryItem(name: "q", value: "\(searchText)")])
        print("URL: \(url)")
        return NetworkManager.fetchURL(url) as AnyPublisher<[Item], Error>
    }
}

class MockProductsService: ProductsServicing {
        
    func fetchItems(searchText: String) -> AnyPublisher<[Item], Error> {
        let items = Bundle.main.decode([Item].self, from: "mock_items.json")
        return Just(items)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
