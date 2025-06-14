//
//  ProductID.swift
//  Navigator
//
//  Created by Prachi Gauriar on 6/13/25.
//

import Foundation


struct ProductID: Codable, Hashable, RawRepresentable, Sendable {
    let rawValue: String


    init(rawValue: String) {
        self.rawValue = rawValue
    }
}
