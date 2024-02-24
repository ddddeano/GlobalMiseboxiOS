//
//  File.swift
//  
//
//  Created by Daniel Watson on 23.02.2024.
//

import Foundation
import SwiftUI

public struct EditToggleImageButton: View {
    @Binding var isEditing: Bool
    var isValid: Bool
    let onEdit: () -> Void
    let onDone: () async -> Void
    let onCancel: () -> Void
    
    public init(isEditing: Binding<Bool>, isValid: Bool, onEdit: @escaping () -> Void, onDone: @escaping () async -> Void, onCancel: @escaping () -> Void) {
        self._isEditing = isEditing
        self.isValid = isValid
        self.onEdit = onEdit
        self.onDone = onDone
        self.onCancel = onCancel
    }
    
    public var body: some View {
        HStack {
            if isEditing {
                Image(systemName: "x.circle")
                    .foregroundColor(.red)
                    .onTapGesture {
                        onCancel()
                        isEditing = false
                    }
            }
            
            Image(systemName: isEditing ? "checkmark.circle" : "pencil.circle")
                .foregroundColor(.blue)
                .onTapGesture {
                    if isEditing {
                        Task {
                            await onDone()
                            isEditing = false
                        }
                    } else if !isEditing {
                        isEditing = true
                        onEdit()
                    }
                }
        }
    }
}
public struct CircleButton: View {
    var iconType: IconType
    var size: CGFloat
    var background: Color
    var foregroundColor: Color
    var strokeColor: Color
    var action: () -> Void

    // Public initializer
    public init(iconType: IconType, size: CGFloat, background: Color, foregroundColor: Color, strokeColor: Color, action: @escaping () -> Void) {
        self.iconType = iconType
        self.size = size
        self.background = background
        self.foregroundColor = foregroundColor
        self.strokeColor = strokeColor
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            imageForIconType(iconType)
                .frame(width: size, height: size)
                .overlay(Circle().stroke(strokeColor, lineWidth: 1))
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
