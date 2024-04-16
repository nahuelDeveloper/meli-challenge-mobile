//
//  Meli_ChallengeApp.swift
//  Meli Challenge
//
//  Created by Nahuel Jose Roldan on 09/04/2024.
//

import SwiftUI

/// Entry point for the app. Here we instantiate the **AppCoordinator**. Along with a **NavigationStack**, the app navigation is handled.
@main
struct Meli_ChallengeApp: App {
    @StateObject private var appCoordinator = AppCoordinator(path: NavigationPath())
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $appCoordinator.path) {
                appCoordinator.start()
                    .navigationDestination(for: String.self) { searchText in
                        appCoordinator.createProductsView(searchText: searchText)
                    }
                    .navigationDestination(for: Product.self) { product in
                        appCoordinator.createProductDetailView(product: product)
                    }
            }
        }
        .environmentObject(appCoordinator)
    }
}
