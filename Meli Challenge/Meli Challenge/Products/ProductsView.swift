//
//  ProductsView.swift
//  Meli Challenge
//
//  Created by Nahuel Jose Roldan on 09/04/2024.
//

import SwiftUI
import Combine

/// Displays a list of products based on the text searched by the user in **ProductSearchView**.
struct ProductsView: View {
    @ObservedObject var viewModel: ProductsViewModel
    @Environment(\.dismiss) private var dismiss
    @State private var isShowingErrorAlert = false
        
    let selectProductAction = PassthroughSubject<Product, Never>()
    
    var body: some View {
        content
            .navigationTitle(viewModel.title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbarViewModifier()
            .onFirstAppear { viewModel.loadItems() }
    }
    
    private var content: some View {
        switch viewModel.state {
        case .idle:
            return Color.clear.eraseToAnyView()
        case .loading:
            return Spinner(isAnimating: true, style: .large).eraseToAnyView()
        case .loaded:
            return productListView.eraseToAnyView()
        case .error:
            showErrorAlert()
            return emptyView.alert("Ha ocurrido un error", isPresented: $isShowingErrorAlert) {
                Button("Aceptar", action: {
                    viewModel.state = .loaded
                    dismiss()
                })
            } message: {
                Text("Por favor, vuelva a intentar su búsqueda en otro momento")
            }.eraseToAnyView()
        }
    }
    
    func showErrorAlert() {
        // Wait until view is updated
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.isShowingErrorAlert = true
        }
    }
    
    private func createProductImageView(url: URL) -> some View {
        AsyncImage(url: url) { image in
            image.resizable()
        } placeholder: {
            Spinner(isAnimating: true, style: .medium)
        }
        .frame(width: 80, height: 80)
    }
    
    private func createProductDetailView(product: Product) -> some View {
        return ProductDetailView(viewModel: ProductDetailViewModel(product: product))
    }
        
    private var productListView: some View {
        if viewModel.products.isEmpty {
            return emptyView.eraseToAnyView()
        } else {
            return List {
                ForEach(viewModel.products) { product in
                    NavigationLink {
                        createProductDetailView(product: product)
                    } label: {
                        HStack(spacing: 20) {
                            createProductImageView(url: product.thumbnailURL)
                            Text(product.title)
                        }
                    }
                }
            }.eraseToAnyView()
        }
    }
    
    private var emptyView: some View {
        VStack {
            Spacer()
            Text("No hay resultados disponibles")
                .font(.headline)
            Spacer()
            Spacer()
        }
    }
}

#Preview {
    ProductsView(viewModel: ProductsViewModel(productsService: ProductsService(),
                                              title: "Search text"))
}
