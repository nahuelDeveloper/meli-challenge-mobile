//
//  Meli_ChallengeApp.swift
//  Meli Challenge
//
//  Created by Nahuel Jose Roldan on 09/04/2024.
//

import SwiftUI

@main
struct Meli_ChallengeApp: App {
    @StateObject private var appCoordinator = AppCoordinator(path: NavigationPath())
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $appCoordinator.path) {
                appCoordinator.start()
                    .navigationDestination(for: ProductScreen.self) { screen in
                        switch screen {
                        case .products:
                            appCoordinator.createProductsView()
                        case .detail:
                            ProductDetailView()
                        }
                    }
            }
        }
        .environmentObject(appCoordinator)
    }
}
