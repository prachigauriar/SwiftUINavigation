//
//  ExperiencePickerViewModeling.swift
//  Navigator
//
//  Created by Prachi Gauriar on 6/12/25.
//

import Foundation
import SwiftUI


@MainActor
protocol ExperiencePickerViewModeling: Observable {
    associatedtype SomeProductGridViewModel: ProductGridViewModeling
    associatedtype SomeProductListViewModel: ProductListViewModeling

    func navigate(to url: URL)
    func navigateToRandomExperience()

    func makeProductGridViewModel() -> SomeProductGridViewModel
    func makeProductListViewModel() -> SomeProductListViewModel
}


enum Experience: Codable, Hashable, Sendable {
    case productGrid
    case productList
}
