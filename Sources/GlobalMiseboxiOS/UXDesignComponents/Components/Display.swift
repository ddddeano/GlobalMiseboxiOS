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

    public init(title: String) {
        self.title = title
    }

    public var body: some View {
        Text(title.uppercased())
            .font(.caption)
            .fontWeight(.bold)
            .padding(.top, 2)
            .foregroundColor(.primary)
    }
}

public struct MainTopView: View {
    var title: String
    var subtitle: String

    public var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.headline)
            Text(subtitle)
                .font(.subheadline)
            Divider().padding(.trailing)
        }
    }
}
