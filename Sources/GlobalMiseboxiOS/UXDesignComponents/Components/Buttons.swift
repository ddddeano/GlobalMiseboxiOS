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
