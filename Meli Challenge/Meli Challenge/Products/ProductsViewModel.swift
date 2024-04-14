//
//  ProductsViewModel.swift
//  Meli Challenge
//
//  Created by Nahuel Jose Roldan on 11/04/2024.
//

import Foundation
import Combine

class ProductsViewModel: ObservableObject {
    private let productsService: ProductsServicing
    let title: String
    private(set) var products = [Item]() {
        didSet {
            print("products count: \(products.count)")
        }
    }
    @Published var state = State.idle
    var cancellables = Set<AnyCancellable>()
    
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

extension ProductsViewModel {
    enum State {
        case idle
        case loading
        case loaded
    }
}
