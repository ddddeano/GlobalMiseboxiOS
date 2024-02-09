//
//  Global.swift
//
//
//  Created by Daniel Watson on 05.02.2024.
//

import Foundation

public protocol ManagerDelegate: AnyObject {
    func resetData()
}

public struct DocCollection {
    public var doc: String
    public var collection: String
    
    public init(doc: String, collection: String) {
          self.doc = doc
          self.collection = collection
      }
}
