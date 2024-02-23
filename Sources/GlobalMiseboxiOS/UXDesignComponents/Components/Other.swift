//
//  File.swift
//  
//
//  Created by Daniel Watson on 23.02.2024.
//

import Foundation
import SwiftUI

// MARK: Ancillaries
public enum IconType {
    case asset(String)
    case system(String)
}
// MARK: Structs


// MARK: Buttons

public struct CircleButton: View {
    var iconType: IconType
    var size: CGFloat
    var background: Color
    var foregroundColor: Color
    var strokeColor: Color
    var action: () -> Void
    
    public var body: some View {
        Button(action: action) {
            imageForIconType(iconType)
                .frame(width: size, height: size)
                .overlay(Circle().stroke(strokeColor, lineWidth: 1)) // Use strokeColor here
                .background(background)
                .foregroundColor(foregroundColor)
                .clipShape(Circle())
        }
    }
    
    @ViewBuilder
    private func imageForIconType(_ iconType: IconType) -> some View {
        switch iconType {
        case .asset(let name):
            Image(name)
                .resizable()
                .scaledToFit()
        case .system(let name):
            Image(systemName: name)
                .resizable()
                .scaledToFit()
                .padding(size / 5) // Adjust padding based on size
        }
    }
}



// MARK: View extensions

extension View {
    public func customInput(isRequired: Bool = false, showRequiredBorder: Bool = false, backgroundColor: Color, requiredBorderColor: Color, defaultBorderColor: Color) -> some View {
        modifier(CustomInputModifier(isRequired: isRequired, showRequiredBorder: showRequiredBorder, backgroundColor: backgroundColor, requiredBorderColor: requiredBorderColor, defaultBorderColor: defaultBorderColor))
    }
    public func pageStyle(backgroundColor: Color) -> some View {
        self.modifier(PageModifier(backgroundColor: backgroundColor))
    }
    public func sheetStyle(backgroundColor: Color) -> some View {
        self.modifier(SheetModifier(backgroundColor: backgroundColor))
    }
    public func sectionStyle(borderColor: Color) -> some View {
        self.modifier(SectionModifier(borderColor: borderColor))
    }
    public func listStyle() -> some View {
        self.modifier(ListStyleModifier())
    }
    public func displayValid(backgroundColor: Color, borderColor: Color) -> some View {
        self.modifier(DisplayValidModifier(backgroundColor: backgroundColor, borderColor: borderColor))
    }
    public func displayEdit(backgroundColor: Color, borderColor: Color) -> some View {
        self.modifier(DisplayEditModifier(backgroundColor: backgroundColor, borderColor: borderColor))
    }
}


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
