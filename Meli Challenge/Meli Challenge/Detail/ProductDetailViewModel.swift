//
//  ProductDetailViewModel.swift
//  Meli Challenge
//
//  Created by Nahuel Jose Roldan on 11/04/2024.
//

import Foundation
import Combine

/// Encapsulates business logic for **ProductDetail**.
class ProductDetailViewModel {
    let product: Product
    let currencyCode = Locale.current.currency?.identifier ?? "USD"
    
    init(product: Product) {
        self.product = product
    }
}
