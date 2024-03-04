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
    var borderColor: Color = .purple
    var borderWidth: CGFloat = 1
    var backgroundColor: Color = Color.purple.opacity(0.1)

    var cornerRadius: CGFloat = 12

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
