//
//  AppCoordinator.swift
//  Meli Challenge
//
//  Created by Nahuel Jose Roldan on 10/04/2024.
//

import SwiftUI
import Combine

/// Manages navigation between the app screens. This class instantiates the Views, and injects Services and ViewModels. It also detects the events from the Views that should fire navigation between screens.
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
                StorageManager.shared.storeSearchedText(searchText)
                self?.path.append(searchText)
            }
            .store(in: &cancellables)
    }
    
    func createProductsView(searchText: String) -> some View {
        let productsService: ProductsServicing = NetworkManager.apiEnvironment == .mock ? MockProductsService() : ProductsService()
        let viewModel = ProductsViewModel(productsService: productsService, title: searchText)
        let view = ProductsView(viewModel: viewModel)
        bind(productsView: view)
        return view
    }
    
    private func bind(productsView: ProductsView) {
        productsView.selectProductAction
            .receive(on: DispatchQueue.main)
            .sink { [weak self] product in
                self?.path.append(product)
            }
            .store(in: &cancellables)
    }
    
    func createProductDetailView(product: Product) -> some View {
        let view = ProductDetailView(viewModel: ProductDetailViewModel(product: product))
        return view
    }
}
