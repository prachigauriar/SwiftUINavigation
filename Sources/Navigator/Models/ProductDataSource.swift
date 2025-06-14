//
//  ProductDataSource.swift
//  Navigator
//
//  Created by Prachi Gauriar on 6/13/25.
//

import DevFoundation
import Foundation


@Observable
final class ProductDataSource {
    let products: [Product]


    init() {
        let gibberishGenerator = GibberishGenerator.latin

        self.products = (0 ..< 100).map { (i) in
            let name = (0 ..< 2).map { _ in gibberishGenerator.generateWord() }.joined(separator: " ").capitalized

            return Product(
                id: .init(rawValue: "product-\(i)"),
                name: name,
                abbreviatedDescription: gibberishGenerator.generateSentence(),
                description: gibberishGenerator.generateParagraph(),
                color: ProductColor.allCases.randomElement()!
            )
        }
    }


    func product(for id: ProductID) -> Product? {
        return products.first { $0.id == id }
    }
}
