//
//  ProductSearchViewModelTests.swift
//  Meli ChallengeTests
//
//  Created by Nahuel Jose Roldan on 13/04/2024.
//

import XCTest

final class ProductSearchViewModelTests: XCTestCase {
    var sut: ProductSearchViewModel!
    
    override func setUpWithError() throws {
        sut = ProductSearchViewModel()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_loadSuggestions() {
        XCTAssertEqual(sut.searchSuggestions.count, 1278)
    }
    
    func test_getEmptySuggestions() {
        sut.searchText = "aa"
        sut.updateSuggestions()
        XCTAssert(sut.filteredSuggestions.isEmpty)
    }
    
    func test_getSingleSuggestion() {
        sut.searchText = "acei"
        sut.updateSuggestions()
        XCTAssertEqual(sut.filteredSuggestions[0], "aceite")
    }
    
    func test_getMultipleSuggestions() {
        sut.searchText = "ace"
        sut.updateSuggestions()
        XCTAssertEqual(sut.filteredSuggestions, ["aceite", "aceptación", "enlace", "placer"])
    }
}
