//
//  ProductListViewModeling.swift
//  Navigator
//
//  Created by Prachi Gauriar on 6/12/25.
//

import Foundation
import SwiftUI


@MainActor
protocol ProductListViewModeling: Observable {
    associatedtype SomeProductDetailViewModel: ProductDetailViewModeling

    var listItemViewModels: [ProductListItemViewModel] { get }

    func productDetailViewModel(for id: ProductID) -> SomeProductDetailViewModel?
}


@MainActor
struct ProductListItemViewModel: Identifiable {
    var id: ProductID

    var name: String
    var description: String
    var color: Color
}
