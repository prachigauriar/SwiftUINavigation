//
//  ProductGridView.swift
//  Navigator
//
//  Created by Prachi Gauriar on 6/12/25.
//

import Foundation
import SwiftUI


struct ProductGridView<ViewModel>: View where ViewModel: ProductGridViewModeling {
    @State var viewModel: ViewModel


    var body: some View {
        ScrollView {
            Grid(horizontalSpacing: 16, verticalSpacing: 16) {
                ForEach(viewModel.rowViewModels) { (rowViewModel) in
                    GridRow {
                        NavigationLink(value: rowViewModel.leadingViewModel.id) {
                            ProductCard(
                                name: rowViewModel.leadingViewModel.name,
                                description: rowViewModel.leadingViewModel.description,
                                color: rowViewModel.leadingViewModel.color
                            )
                        }

                        if let trailingViewModel = rowViewModel.trailingViewModel {
                            NavigationLink(value: trailingViewModel.id) {
                                ProductCard(
                                    name: trailingViewModel.name,
                                    description: trailingViewModel.description,
                                    color: trailingViewModel.color
                                )
                            }
                        }
                    }
                    .accentColor(.black)
                }
            }
            .navigationDestination(for: ProductID.self) { (productID) in
                ProductDetailView(viewModel: viewModel.productDetailViewModel(for: productID))
            }
            .padding()
        }
        .navigationTitle("Product Grid")
    }
}


struct ProductCard: View {
    let name: String
    let description: String
    let color: Color


    var body: some View {
        VStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(color)

            VStack(alignment: .leading) {
                Text(name)
                    .font(.headline)
                    .lineLimit(1)
                Text(description)
                    .font(.caption)
                    .lineLimit(1)
            }
        }
        .frame(height: 150)
    }
}


#Preview {
    ProductGridView(
        viewModel: ProductGridViewModel(productDataSource: ProductDataSource())
    )
}
