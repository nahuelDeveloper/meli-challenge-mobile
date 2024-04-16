//
//  ProductsServicing.swift
//  Meli Challenge
//
//  Created by Nahuel Jose Roldan on 16/04/2024.
//

import Foundation
import Combine

/// Protocol that must be implemented by **ProductsService** and **MockProductsService**.
protocol ProductsServicing {
    func fetchItems(searchText: String) -> AnyPublisher<[Product], Error>
}
