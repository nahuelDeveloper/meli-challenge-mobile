//
//  ProductDetailViewModel.swift
//  Meli Challenge
//
//  Created by Nahuel Jose Roldan on 11/04/2024.
//

import Foundation
import Combine

class ProductDetailViewModel {
    let product: Item
    let currencyCode = Locale.current.currency?.identifier ?? "USD"
    
    init(product: Item) {
        self.product = product
    }
}
