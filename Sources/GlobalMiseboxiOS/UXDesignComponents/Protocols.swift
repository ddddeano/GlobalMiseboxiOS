//
//  Protocols.swift
//
//
//  Created by Daniel Watson on 23.02.2024.
//

import Foundation

public protocol NavigationSection: RawRepresentable, CaseIterable, Identifiable where RawValue == String {
    var iconName: String { get }
    var displayName: String { get }
}
