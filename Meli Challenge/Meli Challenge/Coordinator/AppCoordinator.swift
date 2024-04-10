//
//  AppCoordinator.swift
//  Meli Challenge
//
//  Created by Nahuel Jose Roldan on 10/04/2024.
//

import SwiftUI
import Combine

enum ProductScreen {
    case products
    case detail
}

final class AppCoordinator: ObservableObject {
    @Published var path: NavigationPath
    private var cancellables = Set<AnyCancellable>()
    
    init(path: NavigationPath) {
        self.path = path
    }
    
    @ViewBuilder
    func start() -> some View {
        createProductSearchView()
    }
    
    private func createProductSearchView() -> some View {
        let view = ProductSearchView()
        bind(productSearchView: view)
        return view
    }
    
    private func bind(productSearchView: ProductSearchView) {
        productSearchView.searchAction
            .receive(on: DispatchQueue.main)
            .sink { [weak self] searchText in
                print("Search text: \(searchText)")
                self?.path.append(ProductScreen.products)
            }
            .store(in: &cancellables)
    }
    
    func createProductsView() -> some View {
        let view = ProductsView()
        bind(productsView: view)
        return view
    }
    
    private func bind(productsView: ProductsView) {
        productsView.selectProductAction
            .receive(on: DispatchQueue.main)
            .sink { [weak self] product in
                print("Selected product")
                self?.path.append(ProductScreen.detail)
            }
            .store(in: &cancellables)
    }
}
