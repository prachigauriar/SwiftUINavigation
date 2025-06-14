//
//  NavigationPathProvider.swift
//  Navigator
//
//  Created by Prachi Gauriar on 6/13/25.
//

import Foundation
import SwiftUI


@MainActor
protocol NavigationPathProvider: Observable {
    var navigationPath: NavigationPath { get set }
}
