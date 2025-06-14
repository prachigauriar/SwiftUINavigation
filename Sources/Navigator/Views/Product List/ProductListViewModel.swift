//
//  ProductListViewModel.swift
//  Navigator
//
//  Created by Prachi Gauriar on 6/13/25.
//

import Foundation
import SwiftUI


@Observable
final class ProductListViewModel: ProductListViewModeling {
    let productDataSource: ProductDataSource

    let listItemViewModels: [ProductListItemViewModel]


    init(productDataSource: ProductDataSource) {
        self.productDataSource = productDataSource
        self.listItemViewModels = productDataSource.products.map(ProductListItemViewModel.init(product:))
    }


    func productDetailViewModel(for id: ProductID) -> ProductDetailViewModel? {
        return productDataSource.product(for: id).map(ProductDetailViewModel.init(product:))
    }
}



extension ProductListItemViewModel {
    fileprivate init(product: Product) {
        self.init(
            id: product.id,
            name: product.name,
            description: product.abbreviatedDescription,
            color: product.color.swiftUIColor
        )
    }
}
