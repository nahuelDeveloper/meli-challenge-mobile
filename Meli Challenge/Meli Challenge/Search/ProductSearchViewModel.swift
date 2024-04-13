//
//  ProductSearchViewModel.swift
//  Meli Challenge
//
//  Created by Nahuel Jose Roldan on 11/04/2024.
//

import Foundation
import SwiftUI

private let mockSearchSuggestions = ["auto", "mesa", "libro", "cocina", "billetera",
                                     "dormitorio", "futbol", "golosina", "hora",
                                     "jardin", "patio", "quincho"]

class ProductSearchViewModel: ObservableObject {
    @Published var searchText = ""
    lazy var searchSuggestions = Bundle.main.decode([String].self, from: "search_suggestions.json")
    var filteredSuggestions = [String]()
    
    func updateSuggestions() {
        filteredSuggestions = searchSuggestions.filter({ suggestion in
            suggestion.contains(searchText)
        })
    }
}
