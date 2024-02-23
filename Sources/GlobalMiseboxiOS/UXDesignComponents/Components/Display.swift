//
//  Display.swift
//  
//
//  Created by Daniel Watson on 23.02.2024.
//

import Foundation
import SwiftUI

public struct SectionTitle: View {
    var title: String
    public var body: some View {
        Text(title.uppercased())
            .font(.caption)
            .fontWeight(.bold)
            .padding(.top, 2)
            .foregroundColor(.primary)
    }
}
