//
//  ProductSearchView.swift
//  Meli Challenge
//
//  Created by Nahuel Jose Roldan on 09/04/2024.
//

import SwiftUI
import Combine

struct ProductSearchView: View {
    @ObservedObject var viewModel: ProductSearchViewModel
    
    let searchAction = PassthroughSubject<String, Never>()
    
    var body: some View {
        // TODO: decide what to show here, maybe a list with previously searched products.
        List {
            Text("No hay búsquedas recientes")
        }
        .navigationTitle("Meli Challenge")
        .navigationBarTitleDisplayMode(.inline)
        .searchable(text: $viewModel.searchText, prompt: "Buscar en Mercado Libre") {
            // TODO: load suggestions from view model.
            ForEach($viewModel.searchSuggestions, id: \.self) { suggestion in
                Text(suggestion.wrappedValue)
                    .searchCompletion(suggestion.wrappedValue)
            }
        }
        .onSubmit(of: .search) {
            searchAction.send(viewModel.searchText)
        }
        .onChange(of: viewModel.searchText) { oldValue, newValue in
            // TODO: add logic to update suggestions as the user types in.
            viewModel.search()
        }
    }
}

#Preview {
    ProductSearchView(viewModel: ProductSearchViewModel())
}
