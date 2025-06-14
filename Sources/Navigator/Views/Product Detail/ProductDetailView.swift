//
//  ProductDetailView.swift
//  Navigator
//
//  Created by Prachi Gauriar on 6/13/25.
//

import Foundation
import SwiftUI


struct ProductDetailView<ViewModel>: View where ViewModel: ProductDetailViewModeling {
    @State var viewModel: ViewModel?


    var body: some View {
        Group {
            if let viewModel {
                NonEmptyProductDetailView(viewModel: viewModel)
            } else {
                VStack(spacing: 16) {
                    Text("Product Not Found")
                        .font(.headline)
                    Text("Sorry, we couldn’t find that product. It may be sold out or otherwise unavailable.")
                        .font(.body)
                }
                .padding()
            }
        }
        .navigationTitle("Product Detail")
    }
}


private struct NonEmptyProductDetailView<ViewModel>: View where ViewModel: ProductDetailViewModeling {
    @State var viewModel: ViewModel


    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(viewModel.color)
                    .frame(height: 250)

                VStack(alignment: .leading, spacing: 16) {
                    Text(viewModel.name)
                        .font(.headline)
                    Text(viewModel.description)
                        .font(.body)
                }
            }
            .padding()
        }
    }
}
