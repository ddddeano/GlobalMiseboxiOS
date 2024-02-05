//
//  Global.swift
//
//
//  Created by Daniel Watson on 05.02.2024.
//

import Foundation

public let defaultImage = "https://firebasestorage.googleapis.com/v0/b/misebox-78f9c.appspot.com/o/avatars%2Fdog1.jpg?alt=media&token=a8d8e14e-01af-45ae-8e9d-2033c5a81ec4"

public protocol ManagerDelegate: AnyObject {
    func resetData()
}

public struct DocCollection {
    public var doc: String
    public var collection: String
}
