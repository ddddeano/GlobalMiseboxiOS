//
//  File.swift
//  
//
//  Created by Daniel Watson on 23.02.2024.
//

import Foundation
import SwiftUI
// MARK: Modifiers
public struct CustomInputModifier: ViewModifier {
    var isRequired: Bool
    var showRequiredBorder: Bool
    var backgroundColor: Color
    var requiredBorderColor: Color
    var defaultBorderColor: Color

    public func body(content: Content) -> some View {
        content
            .padding(14)
            .background(backgroundColor)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(isRequired && showRequiredBorder ? requiredBorderColor : defaultBorderColor, lineWidth: 2)
            )
            .padding(.horizontal)
    }
}

public struct DisplayValidModifier: ViewModifier {
    var backgroundColor: Color
    var borderColor: Color

    public func body(content: Content) -> some View {
        content
            .padding(10)
            .background(backgroundColor)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(borderColor, lineWidth: 1)
            )
    }
}

public struct DisplayEditModifier: ViewModifier {
    var backgroundColor: Color
    var borderColor: Color

    public  func body(content: Content) -> some View {
        content
            .padding(10)
            .background(backgroundColor)
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(borderColor, lineWidth: 2)
            )
    }
}

public struct PageModifier: ViewModifier {
    var backgroundColor: Color

    public func body(content: Content) -> some View {
        content
            .background(backgroundColor)
    }
}

public struct SheetModifier: ViewModifier {
    var backgroundColor: Color

    public func body(content: Content) -> some View {
        content
            .background(backgroundColor)
            .edgesIgnoringSafeArea(.all)
    }
}

public struct SectionModifier: ViewModifier {
    var borderColor: Color

    
    public func body(content: Content) -> some View {
        content
            .padding()
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10).stroke(borderColor, lineWidth: 1)
            )
    }
}

public struct ListStyleModifier: ViewModifier {
    public func body(content: Content) -> some View {
        content
            .frame(height: 35)
    }
}
