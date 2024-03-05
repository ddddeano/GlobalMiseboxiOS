
//  ProfileView.swift
//
//
//  Created by Daniel Watson on 05.03.2024.
//

import SwiftUI

public protocol ProfileSection: CaseIterable, Identifiable, Hashable, RawRepresentable where RawValue == String {
    var iconName: String { get }
    var displayName: String { get }
}

public struct ProfileView<Section: ProfileSection, Destination: View>: View {
    @EnvironmentObject var env: EnvironmentManager
    let sections: [Section]
    let destinationView: (Section) -> Destination
    @State private var navigationPath = NavigationPath()

    public init(sections: [Section], destinationView: @escaping (Section) -> Destination) {
        self.sections = sections
        self.destinationView = destinationView
    }

    public var body: some View {
        NavigationStack(path: $navigationPath) {
            ScrollView {
                ForEach(sections, id: \.self) { section in
                    Button {
                        navigationPath.append(section)
                    } label: {
                        HStack {
                            iconView(systemName: section.iconName)
                            Text(section.displayName)
                            Spacer()
                            iconView(systemName: "chevron.right")
                        }
                        .foregroundColor(env.appLight)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .buttonStyle(PlainButtonStyle())
                    .contentShape(Rectangle())
                }
                .sectionStyle(borderColor: env.appLight)
            }
            .padding()
        }
        .navigationDestination(for: Section.self) { section in
            destinationView(section)
        }
        .pageStyle(backgroundColor: env.appDark.opacity(0.1))
    }


    @ViewBuilder
    private func iconView(systemName: String) -> some View {
        Image(systemName: systemName)
            .resizable()
            .scaledToFit()
            .frame(width: 24, height: 24)
    }
}
