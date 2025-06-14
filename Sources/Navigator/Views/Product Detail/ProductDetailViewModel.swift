//
//  ProductDetailViewModel.swift
//  Navigator
//
//  Created by Prachi Gauriar on 6/13/25.
//

import Foundation
import SwiftUI


@Observable
final class ProductDetailViewModel: ProductDetailViewModeling {
    let product: Product


    init(product: Product) {
        self.product = product
    }


    var name: String {
        return product.name
    }


    var description: String {
        return product.description
    }


    var color: Color {
        product.color.swiftUIColor
    }
}
