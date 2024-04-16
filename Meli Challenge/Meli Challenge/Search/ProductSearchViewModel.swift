//
//  ProductSearchViewModel.swift
//  Meli Challenge
//
//  Created by Nahuel Jose Roldan on 11/04/2024.
//

import Foundation
import SwiftUI

class ProductSearchViewModel: ObservableObject {
    @Published var searchText = ""
    @Published var searchedTexts = StorageManager.shared.retrieveSearchedTexts()
    private(set) var searchSuggestions = Bundle.main.decode([String].self, from: "search_suggestions.json")
    var filteredSuggestions = [String]()
    
    func updateSuggestions() {
        filteredSuggestions = searchSuggestions.filter({ suggestion in
            suggestion.contains(searchText)
        })
    }
}
