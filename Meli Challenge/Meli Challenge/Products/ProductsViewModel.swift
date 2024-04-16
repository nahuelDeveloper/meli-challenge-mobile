//
//  ProductsViewModel.swift
//  Meli Challenge
//
//  Created by Nahuel Jose Roldan on 11/04/2024.
//

import Foundation
import Combine

/// Encapsulates business logic for **ProductsView**.
///
/// Responsibilites
///  - Retrieve a list of **Product** from the API, via a concrete implementation of **ProductsServicing**.
///  - Manage the state of the View.
class ProductsViewModel: ObservableObject {
    private let productsService: ProductsServicing
    @Published var state = State.idle
    var cancellables = Set<AnyCancellable>()
    let title: String
    private(set) var products = [Product]()
    
    init(productsService: ProductsServicing, title: String) {
        self.productsService = productsService
        self.title = title
    }
    
    func loadItems() {
        state = .loading
        productsService.fetchItems(searchText: title)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                print("load items completion: \(completion)")
            } receiveValue: { items in
                print("load items: \(items)")
                self.products = items
                self.state = .loaded
            }
            .store(in: &cancellables)
    }
}

/// Encapsulates the possible states in which **ProductsView** can be.
extension ProductsViewModel {
    enum State {
        case idle
        case loading
        case loaded
    }
}
