//
//  File.swift
//  
//
//  Created by Daniel Watson on 26.02.2024.
//

import Foundation
import SwiftUI

extension Color {
    // Initialize Color from hex code
    public init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let red = Double((int >> 16) & 0xFF) / 255.0
        let green = Double((int >> 8) & 0xFF) / 255.0
        let blue = Double(int & 0xFF) / 255.0
        self.init(red: red, green: green, blue: blue)
    }
}


public struct ProfileCardStyle: ViewModifier {
    var borderColor: Color
    var borderWidth: CGFloat
    var backgroundColor: Color
    var cornerRadius: CGFloat

    // Public initializer
    public init(borderColor: Color = .purple, borderWidth: CGFloat = 1, backgroundColor: Color = Color.purple.opacity(0.1), cornerRadius: CGFloat = 12) {
        self.borderColor = borderColor
        self.borderWidth = borderWidth
        self.backgroundColor = backgroundColor
        self.cornerRadius = cornerRadius
    }

    public func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .frame(height: 230)
            .background(backgroundColor)
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(borderColor, lineWidth: borderWidth)
            )
            .cornerRadius(cornerRadius)
    }
}

