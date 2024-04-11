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
    let description: String
    let price: Double
}
