//
//  ProductsViewModel.swift
//  Meli Challenge
//
//  Created by Nahuel Jose Roldan on 11/04/2024.
//

import Foundation
import Combine

class ProductsViewModel: ObservableObject {
    private let productsService: ProductsServicing
    let title: String
    @Published var products = [Item]()
    
    init(productsService: ProductsServicing, title: String) {
        self.productsService = productsService
        self.title = title
    }
    
    func loadItems() {
        products = productsService.fetchItems()
    }
}
