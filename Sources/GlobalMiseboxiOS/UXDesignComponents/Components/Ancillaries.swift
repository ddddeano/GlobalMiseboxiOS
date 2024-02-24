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

