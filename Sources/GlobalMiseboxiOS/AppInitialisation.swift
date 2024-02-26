//
//  File.swift
//  
//
//  Created by Daniel Watson on 26.02.2024.
//

import Foundation
import SwiftUI
import FirebaseiOSMisebox

public class EnvironmentManager {
    public static let env = EnvironmentManager()
    public var mode: EnvironmentConfiguration = .development
    public var welcome = ""
    public var motto = ""
    public var smallPrint = ""
    public var appLight: Color
    public var appDark: Color
    
    private init() {
        // Initialize with default colors
        self.appLight = .persianIndigo
        self.appDark = .lavender
    }
    
    public init(appLight: Color, appDark: Color) {
        // Initialize with custom colors
        self.appLight = appLight
        self.appDark = appDark
    }
}

// Alias for easier reference
public typealias Kind = EnvironmentManager
