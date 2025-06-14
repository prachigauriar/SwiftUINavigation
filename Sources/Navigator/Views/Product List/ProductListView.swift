//
//  ProductListView.swift
//  Navigator
//
//  Created by Prachi Gauriar on 6/12/25.
//

import Foundation
import SwiftUI


struct ProductListView<ViewModel>: View where ViewModel: ProductListViewModeling {
    @State var viewModel: ViewModel


    var body: some View {
        List(viewModel.listItemViewModels) { (listItemViewModel) in
            NavigationLink(value: listItemViewModel.id) {
                ProductCell(
                    name: listItemViewModel.name,
                    description: listItemViewModel.description,
                    color: listItemViewModel.color
                )
            }
            .accentColor(.black)
            .listRowSeparator(.hidden)
        }
        .navigationDestination(for: ProductID.self) { (productID) in
            ProductDetailView(viewModel: viewModel.productDetailViewModel(for: productID))
        }
        .listStyle(.plain)
        .navigationTitle("Product List")
    }
}


struct ProductCell: View {
    let name: String
    let description: String
    let color: Color


    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundStyle(color)
                .frame(width: 64, height: 64)

            VStack(alignment: .leading) {
                Text(name)
                    .font(.headline)
                Text(description)
                    .font(.caption)
            }
        }
    }
}


#Preview {
    ProductListView(
        viewModel: ProductListViewModel(productDataSource: ProductDataSource())
    )
}

