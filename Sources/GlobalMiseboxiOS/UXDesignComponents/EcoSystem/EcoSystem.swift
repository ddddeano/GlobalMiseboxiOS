//
//  [GlobalMiseboxiOS]MiseboxEcosystem.swift
//
//
//  Created by Daniel Watson on 20.02.2024.
//

import Foundation
import SwiftUI

public class MiseboxEcosystem {
    public struct Role: Equatable {
        public let doc: String
        public let collection: String
        public let appLight: Color
        public let appDark: Color
        public let isAvailable: Bool
        public let welcome: String
        public let motto: String
        public let smallPrint: String
        
        public static let miseboxUser = Role(doc: "misebox-user", collection: "misebox-users", appLight: .lavender, appDark: .persianIndigo, isAvailable: true, welcome: "Welcome to the MiseBox Profile app", motto: "Manage Your Central Account Browse The Ecosystem", smallPrint: "Speak To a developer, upgrade subscription")

        public static let agent = Role(doc: "agent", collection: "agents", appLight: .teaGreen, appDark: .britishRacingGreen, isAvailable: true, welcome: "Welcome to the Agency app", motto: "Post Profiles, Browse Jobs, and Manage Your Gigs", smallPrint: "Boost Your Earnings with Flexible Missions and Just-in-Time Assignments")
        
        public static let chef = Role(doc: "chef", collection: "chefs", appLight: .apricot, appDark: .chiliRed, isAvailable: true, welcome: "Welcome Chef", motto: "Create and Share Your Culinary Masterpieces", smallPrint: "Expand Your Culinary Network")

        public static let recruiter = Role(doc: "recruiter", collection: "recruiters", appLight: .skyBlue, appDark: .navyBlue, isAvailable: true, welcome: "Welcome Recruiter", motto: "Find and Place Top Talent", smallPrint: "Expand Your Recruiting Reach")

        public static let allCases: [Role] = [.miseboxUser, .chef, .agent, .recruiter]

        public static func find(byDoc doc: String) -> Role? {
            return allCases.first { $0.doc == doc }
        }
    }
}
