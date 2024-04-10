//
//  Model.swift
//  Meli Challenge
//
//  Created by Nahuel Jose Roldan on 10/04/2024.
//

import Foundation

struct Product: Equatable, Hashable {
    let id: UUID
    let name: String
    let price: Double
}

class Model {
    static let searchSuggestions = ["auto", "mesa", "libro"]
    
    static let products = [Product(id: UUID(), name: "Producto 1", price: 100.0),
                           Product(id: UUID(), name: "Producto 2", price: 50.0),
                           Product(id: UUID(), name: "Producto 3", price: 300.0)]
}
