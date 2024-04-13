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
        sut = ProductsViewModel(productsService: MockProductsService(), title: "")
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_getProductsCount() {
        let expectation = XCTestExpectation(description: "Products loaded")
        
        sut.$products
            .dropFirst()
            .sink { _ in
                expectation.fulfill()
            }
            .store(in: &sut.cancellables)
        sut.loadItems()
        wait(for: [expectation], timeout: 5)
        
        XCTAssertEqual(sut.products.count, 2)
    }
}
