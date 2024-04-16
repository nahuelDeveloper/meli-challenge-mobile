//
//  FirstAppearModifier.swift
//  Meli Challenge
//
//  Created by Nahuel Jose Roldan on 16/04/2024.
//

import Foundation
import SwiftUI

/// Modifier that allows running code only one time on Views.
struct FirstAppearModifier: ViewModifier {
    let action: () -> ()
    
    @State private var hasAppeared = false
    
    func body(content: Content) -> some View {
        content.onAppear {
            guard !hasAppeared else { return }
            hasAppeared = true
            action()
        }
    }
}
