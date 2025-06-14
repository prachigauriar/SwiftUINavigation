//
//  ProductGridViewModeling.swift
//  Navigator
//
//  Created by Prachi Gauriar on 6/12/25.
//

import Foundation
import SwiftUI


@MainActor
protocol ProductGridViewModeling: Observable {
    associatedtype SomeProductDetailViewModel: ProductDetailViewModeling

    var rowViewModels: [ProductGridRowViewModel] { get }

    func productDetailViewModel(for id: ProductID) -> SomeProductDetailViewModel?
}


struct ProductGridRowViewModel: Identifiable {
    let leadingViewModel: ProductCardViewModel
    let trailingViewModel: ProductCardViewModel?


    var id: String {
        "\(leadingViewModel.id.rawValue),\(trailingViewModel?.id.rawValue ?? "none")"
    }
}


struct ProductCardViewModel: Identifiable {
    var id: ProductID

    var name: String
    var description: String
    var color: Color
}
