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
