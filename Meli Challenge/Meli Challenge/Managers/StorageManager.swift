//
//  StorageManager.swift
//  Meli Challenge
//
//  Created by Nahuel Jose Roldan on 15/04/2024.
//

import Foundation

/// Wrapper class for **UserDefaults**. Handles local storage of texts searched by the user.
class StorageManager {
    private let userDefaults = UserDefaults.standard
    private let searchedTextsKey = "searchedTexts"
    
    static let shared = StorageManager()
    
    private init() {}
    
    func storeSearchedText(_ searchText: String) {
        if var searchedTexts = userDefaults.array(forKey: searchedTextsKey) as? [String] {
            if !searchedTexts.contains(searchText) {
                searchedTexts.append(searchText)
                userDefaults.setValue(searchedTexts, forKey: searchedTextsKey)
            }
        } else {
            var searchedTexts = [String]()
            searchedTexts.append(searchText)
            userDefaults.setValue(searchedTexts, forKey: searchedTextsKey)
        }
    }
    
    func retrieveSearchedTexts() -> [String] {
        if let searchedTexts = userDefaults.array(forKey: searchedTextsKey) as? [String] {
            return searchedTexts
        }
        return [String]()
    }
    
    func deleteSearchedTexts() {
        userDefaults.setValue(nil, forKey: searchedTextsKey)
    }
}
