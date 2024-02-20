//
//  File.swift
//  
//
//  Created by Daniel Watson on 20.02.2024.
//

import Foundation
import SwiftUI
public class MiseboxEcosystem {
    public struct Role {
        public let doc: String
        public let collection: String
        public let color: Color
        public let isAvailable: Bool
        
        // Define roles without the 'mottoKey' property
        public static let miseboxUser = Role(doc: "misebox-user", collection: "misebox-users", color: .purple, isAvailable: true)
        public static let chef = Role(doc: "chef", collection: "chefs", color: .green, isAvailable: true)
        public static let agent = Role(doc: "agent", collection: "agents", color: .blue, isAvailable: true)
        public static let recruiter = Role(doc: "recruiter", collection: "recruiters", color: .orange, isAvailable: true)
        
        public static let allCases: [Role] = [.miseboxUser, .chef, .agent, .recruiter]
        
        // Helper method to find a role by its document identifier
        public static func find(byDoc doc: String) -> Role? {
            return allCases.first { $0.doc == doc }
        }
    }
}
