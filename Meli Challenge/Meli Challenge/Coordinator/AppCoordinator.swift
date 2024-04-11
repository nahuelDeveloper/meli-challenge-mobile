//
//  AppCoordinator.swift
//  Meli Challenge
//
//  Created by Nahuel Jose Roldan on 10/04/2024.
//

import SwiftUI
import Combine

enum APIEnvironment {
    case mock
    case prod
}

let apiEnvironment = APIEnvironment.mock

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
        let view = ProductSearchView(viewModel: ProductSearchViewModel())
        bind(productSearchView: view)
        return view
    }
    
    private func bind(productSearchView: ProductSearchView) {
        productSearchView.searchAction
            .receive(on: DispatchQueue.main)
            .sink { [weak self] searchText in
                print("Search text: \(searchText)")
                self?.path.append(searchText)
            }
            .store(in: &cancellables)
    }
    
    func createProductsView(searchText: String) -> some View {
        let viewModel = ProductsViewModel(
            productsService: apiEnvironment == .prod ? ProductsService() : MockProductsService())
        let view = ProductsView(viewModel: viewModel)
        bind(productsView: view)
        return view
    }
    
    private func bind(productsView: ProductsView) {
        productsView.selectProductAction
            .receive(on: DispatchQueue.main)
            .sink { [weak self] product in
                print("Selected product")
                self?.path.append(product)
            }
            .store(in: &cancellables)
    }
    
    func createProductDetailView(product: Item) -> some View {
        let view = ProductDetailView(viewModel: ProductDetailViewModel(product: product))
        return view
    }
}
