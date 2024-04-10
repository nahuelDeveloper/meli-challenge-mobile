//
//  ProductSearchView.swift
//  Meli Challenge
//
//  Created by Nahuel Jose Roldan on 09/04/2024.
//

import SwiftUI
import Combine

struct ProductSearchView: View {
    @State private var searchText = ""
    
    let searchAction = PassthroughSubject<String, Never>()
    
    var body: some View {
        // TODO: decide what to show here, maybe a list with previously searched products.
        List {
            Text("No hay búsquedas recientes")
        }
        .navigationTitle("Meli Challenge")
        .navigationBarTitleDisplayMode(.inline)
        .searchable(text: $searchText, prompt: "Buscar en Mercado Libre") {
            // TODO: load suggestions from view model.
            ForEach(Model.searchSuggestions, id: \.self) { suggestion in
                Text(suggestion)
                    .searchCompletion(suggestion)
            }
        }
        .onSubmit(of: .search) {
            print("search")
            searchAction.send(searchText)
        }
        .onChange(of: searchText) { oldValue, newValue in
            // TODO: add logic to update suggestions as the user types in.
        }
    }
}

#Preview {
    ProductSearchView()
}
