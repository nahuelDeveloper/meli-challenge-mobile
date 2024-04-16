//
//  Extensions+View.swift
//  Meli Challenge
//
//  Created by Nahuel Jose Roldan on 16/04/2024.
//

import Foundation
import SwiftUI

extension View {
    
    func eraseToAnyView() -> AnyView { AnyView(self) }
    
    func onFirstAppear(_ action: @escaping () -> ()) -> some View {
        modifier(FirstAppearModifier(action: action))
    }
    
    func toolbarViewModifier() -> some View {
        self.modifier(ToolbarViewModifier())
    }
}
