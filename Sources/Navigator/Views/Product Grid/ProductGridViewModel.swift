//
//  ProductGridViewModel.swift
//  Navigator
//
//  Created by Prachi Gauriar on 6/13/25.
//

import Foundation
import SwiftUI


@Observable
final class ProductGridViewModel: ProductGridViewModeling {
    let productDataSource: ProductDataSource
    let rowViewModels: [ProductGridRowViewModel]


    init(productDataSource: ProductDataSource) {
        self.productDataSource = productDataSource

        let products = productDataSource.products
        self.rowViewModels = stride(from: 0, to: products.count, by: 2).map { (i) in
            ProductGridRowViewModel(
                leadingViewModel: .init(product: products[i]),
                trailingViewModel: (i + 1) < products.count ? .init(product: products[i + 1]) : nil
            )
        }
    }


    func productDetailViewModel(for id: ProductID) -> ProductDetailViewModel? {
        return productDataSource.product(for: id).map(ProductDetailViewModel.init(product:))
    }
}


extension ProductCardViewModel {
    fileprivate init(product: Product) {
        self.init(
            id: product.id,
            name: product.name,
            description: product.abbreviatedDescription,
            color: product.color.swiftUIColor
        )
    }
}
