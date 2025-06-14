//
//  NavigationPath+Convenience.swift
//  Navigator
//
//  Created by Prachi Gauriar on 6/13/25.
//

import Foundation
import SwiftUI


extension NavigationPath {
    mutating func clearAndAppend<V>(_ value: V) where V: Codable, V: Hashable {
        removeLast(count)
        append(value)
    }
}
