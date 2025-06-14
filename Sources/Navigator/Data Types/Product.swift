//
//  Product.swift
//  Navigator
//
//  Created by Prachi Gauriar on 6/13/25.
//

import Foundation


struct Product: Codable, Hashable, Identifiable, Sendable {
    let id: ProductID
    let name: String
    let abbreviatedDescription: String
    let description: String
    let color: ProductColor
}
