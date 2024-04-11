//
//  Model.swift
//  Meli Challenge
//
//  Created by Nahuel Jose Roldan on 10/04/2024.
//

import Foundation

struct Item: Equatable, Hashable, Identifiable {
    let id: UUID
    let title: String
    let description: String
    let price: Double
}
