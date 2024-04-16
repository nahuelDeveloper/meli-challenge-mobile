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
        content
            .navigationTitle("Meli Challenge")
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text: $viewModel.searchText, prompt: "Buscar en Mercado Libre") {
                ForEach($viewModel.filteredSuggestions, id: \.self) { suggestion in
                    Text(suggestion.wrappedValue)
                        .searchCompletion(suggestion.wrappedValue)
                }
            }
            .onSubmit(of: .search) {
                searchAction.send(viewModel.searchText)
            }
            .onChange(of: viewModel.searchText) { oldValue, newValue in
                viewModel.updateSuggestions()
            }
    }
    
    private var content: some View {
        viewModel.searchedTexts.isEmpty ? emptyView.eraseToAnyView() : searchedTextsView.eraseToAnyView()
    }
    
    private var emptyView: some View {
        VStack {
            Spacer()
            Text("No hay búsquedas recientes")
                .font(.headline)
            Spacer()
            Spacer()
        }
    }
    
    private var searchedTextsView: some View {
        Section("Búsquedas recientes") {
            List(viewModel.searchedTexts, id: \.self) { searchedText in
                Text(searchedText)
            }
        }
    }
}

#Preview {
    ProductSearchView(viewModel: ProductSearchViewModel())
}
