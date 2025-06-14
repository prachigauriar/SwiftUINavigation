//
//  ProductColor+SwiftUI.swift
//  Navigator
//
//  Created by Prachi Gauriar on 6/13/25.
//

import Foundation
import SwiftUI


extension ProductColor {
    var swiftUIColor: Color {
        switch self {
        case .red:
            return .red
        case .orange:
            return .orange
        case .yellow:
            return .yellow
        case .green:
            return .green
        case .blue:
            return .blue
        case .indigo:
            return .indigo
        case .violet:
            return .purple
        }
    }
}
