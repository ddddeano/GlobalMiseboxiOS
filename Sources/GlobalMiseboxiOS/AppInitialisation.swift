//
//  File.swift
//  
//
//  Created by Daniel Watson on 26.02.2024.
//

import Foundation
import SwiftUI
import FirebaseiOSMisebox

class EnvironmentManager {
    static let shared = EnvironmentManager()
    var currentEnvironment: EnvironmentConfiguration = .development
    
}

