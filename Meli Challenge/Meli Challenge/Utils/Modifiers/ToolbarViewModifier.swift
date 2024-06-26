//
//  ToolbarViewModifier.swift
//  Meli Challenge
//
//  Created by Nahuel Jose Roldan on 16/04/2024.
//

import SwiftUI

/// Modifier that allows customization of the Navigation Bar.
struct ToolbarViewModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .toolbarBackground(Color.meliYellow, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarColorScheme(.light, for: .navigationBar)
    }
}
