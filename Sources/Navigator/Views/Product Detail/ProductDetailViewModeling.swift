//
//  ProductDetailViewModeling.swift
//  Navigator
//
//  Created by Prachi Gauriar on 6/13/25.
//

import Foundation
import SwiftUI


@MainActor
protocol ProductDetailViewModeling: Identifiable, Observable {
    var name: String { get }
    var description: String { get }
    var color: Color { get }
}
