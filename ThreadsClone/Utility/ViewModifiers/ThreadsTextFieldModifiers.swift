//
//  ThreadsTextFieldModifiers.swift
//  ThreadsClone
//
//  Created by Saksham Tyagi on 07/09/25.
//

import SwiftUI
struct ThreadsTextFieldModifiers: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(8)
    }
}
