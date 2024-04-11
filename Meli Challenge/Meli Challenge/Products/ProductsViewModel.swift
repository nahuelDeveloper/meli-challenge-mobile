//
//  ProductsViewModel.swift
//  Meli Challenge
//
//  Created by Nahuel Jose Roldan on 11/04/2024.
//

import Foundation
import Combine

class ProductsViewModel: ObservableObject {
    let productsService: ProductsServicing
    
    @Published var products = [Item]()
    
    init(productsService: ProductsServicing) {
        self.productsService = productsService
    }
    
    func loadItems() {
        products = productsService.fetchItems()
    }
}
