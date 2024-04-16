//
//  APIResponse.swift
//  Meli Challenge
//
//  Created by Nahuel Jose Roldan on 16/04/2024.
//

import Foundation

struct APIResponse<T: Decodable>: Decodable {
    let results: T
}
