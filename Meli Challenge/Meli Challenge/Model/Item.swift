//
//  Item.swift
//  Meli Challenge
//
//  Created by Nahuel Jose Roldan on 10/04/2024.
//

import Foundation

struct Item: Decodable, Equatable, Hashable, Identifiable {
    let id: String
    let title: String
    let price: Double
}
