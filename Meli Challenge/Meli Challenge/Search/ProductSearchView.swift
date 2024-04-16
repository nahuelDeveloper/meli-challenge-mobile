//
//  ProductSearchView.swift
//  Meli Challenge
//
//  Created by Nahuel Jose Roldan on 09/04/2024.
//

import SwiftUI
import Combine

/// Initial screen of the app. It allows the user to search any product and navigate to **ProductsView**.
struct ProductSearchView: View {
    @ObservedObject var viewModel: ProductSearchViewModel
    @State private var isShowingDeleteAlert = false
    
    let searchAction = PassthroughSubject<String, Never>()
    
    var body: some View {
        content
            .navigationTitle("Meli Challenge")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarViewModifier()
            .searchable(text: $viewModel.searchText, prompt: "Buscar en Mercado Libre") {
                ForEach($viewModel.filteredSuggestions, id: \.self) { suggestion in
                    Text(suggestion.wrappedValue)
                        .searchCompletion(suggestion.wrappedValue)
                }
            }
            .textInputAutocapitalization(.never)
            .onChange(of: viewModel.searchText) { _, _ in
                viewModel.updateSuggestions()
            }
            .onSubmit(of: .search) {
                searchAction.send(viewModel.searchText)
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
        VStack {
            Spacer(minLength: 10)
            Section("Búsquedas recientes") {
                List(viewModel.searchedTexts, id: \.self) { searchedText in
                    Button(searchedText) {
                        viewModel.searchText = searchedText
                        searchAction.send(viewModel.searchText)
                    }
                }
                deleteSearchedTextsView
            }
        }
    }
    
    private var deleteSearchedTextsView: some View {
        Button("Borrar historial") {
            isShowingDeleteAlert = true
        }
        .alert("¿Desea borrar el historial de búsqueda?", isPresented: $isShowingDeleteAlert) {
            Button("Borrar", role: .destructive) {
                viewModel.deleteSearchedTexts()
            }
        } message: {
            Text("Tenga en cuenta que esta acción no se puede deshacer")
        }
    }
}

#Preview {
    ProductSearchView(viewModel: ProductSearchViewModel())
}
