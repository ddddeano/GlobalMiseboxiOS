
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
public class AgentProfileViewNavigation: ObservableObject {
    public init() {}

    public enum ProfileSections: String, CaseIterable, Identifiable, RawRepresentable, ProfileSection {
        case levelOneInfo = "Level One Information"
        case levelTwoInfo = "Level Two Information"
        case levelThreeInfo = "Level Three Information"
        case levelFourInfo = "Level Four Information"

        public var id: Self { self }

        public var iconName: String {
            switch self {
            case .levelOneInfo: return "person.fill"
            case .levelTwoInfo: return "calendar"
            case .levelThreeInfo: return "gearshape.fill"
            case .levelFourInfo: return "star.fill"
            }
        }

        public var displayName: String { self.rawValue }

        @ViewBuilder
        public func view() -> some View {
            switch self {
            case .levelOneInfo:
                LevelOneInfoView()
            case .levelTwoInfo:
                LevelTwoInfoView()
            case .levelThreeInfo:
                LevelThreeInfoView()
            case .levelFourInfo:
                LevelFourInfoView()
            }
        }
    }
}


struct SandboxAgentProfile: View {
    let sections: [AgentProfileViewNavigation.ProfileSections] = [.levelOneInfo, .levelTwoInfo, .levelThreeInfo, .levelFourInfo]

    var body: some View {
        ProfileView(sections: sections) { section in
            section.view()
        }
    }
}


struct LevelOneInfoView: View {
    var body: some View {
        Text("Hello World from 😆 Level One Information!")
    }
}

struct LevelTwoInfoView: View {
    var body: some View {
        Text("Hello World from 😆 Level Two Information!")
    }
}

struct LevelThreeInfoView: View {
    var body: some View {
        Text("Hello World from Level 😆Three Information!")
    }
}

struct LevelFourInfoView: View {
    var body: some View {
        Text("Hello World from Level 😆 Four Information!")
    }
}



