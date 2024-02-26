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
    public static let shared = EnvironmentManager()
    public var mode: EnvironmentConfiguration = .development
}

