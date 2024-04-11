//
//  ProductsViewModelTests.swift
//  Meli ChallengeTests
//
//  Created by Nahuel Jose Roldan on 11/04/2024.
//

import XCTest

final class ProductsViewModelTests: XCTestCase {
    var sut: ProductsViewModel!
    
    override func setUp() {
        sut = ProductsViewModel(productsService: MockProductsService())
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_getProductsCount() {
        sut.loadItems()
        XCTAssertEqual(sut.products.count, 2)
    }
}
