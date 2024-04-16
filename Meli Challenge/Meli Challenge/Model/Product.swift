//
//  Product.swift
//  Meli Challenge
//
//  Created by Nahuel Jose Roldan on 10/04/2024.
//

import Foundation

struct Product: Decodable, Equatable, Hashable, Identifiable {
    let id: String
    let title: String
    let price: Double
    let thumbnail: String
    
    var thumbnailURL: URL {
        return URL(string: thumbnail)!
    }
}
