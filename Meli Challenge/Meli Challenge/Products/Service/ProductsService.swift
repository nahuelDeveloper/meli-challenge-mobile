//
//  ProductsService.swift
//  Meli Challenge
//
//  Created by Nahuel Jose Roldan on 11/04/2024.
//

import Foundation
import Combine

/// Concrete implementation of **ProductsServicing**. Used by the app to retrieve a list of **Product** from the API.
class ProductsService: ProductsServicing {
    
    func fetchItems(searchText: String) -> AnyPublisher<[Product], Error> {
        let url = NetworkManager.baseURL
            .appending(path: "search")
            .appending(queryItems: [URLQueryItem(name: "q", value: "\(searchText)")])
        print("URL: \(url)")
        return NetworkManager.fetchURL2(url) as AnyPublisher<[Product], Error>
    }
}
