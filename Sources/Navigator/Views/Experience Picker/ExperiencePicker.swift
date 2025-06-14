//
//  ExperiencePicker.swift
//  Navigator
//
//  Created by Prachi Gauriar on 6/12/25.
//

import Foundation
import SwiftUI


struct ExperiencePicker<ViewModel>: View where ViewModel: ExperiencePickerViewModeling {
    @State var viewModel: ViewModel


    var body: some View {
        List {
            NavigationLink("Product Grid", value: Experience.productGrid)
            NavigationLink("Product List", value: Experience.productList)
        }
        .navigationTitle("Experiences")
        .navigationDestination(for: Experience.self) { (destination) in
            switch destination {
            case .productGrid:
                ProductGridView(viewModel: viewModel.makeProductGridViewModel())
            case .productList:
                ProductListView(viewModel: viewModel.makeProductListViewModel())
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Navigate to Random Experience", systemImage: "dice") {
                    viewModel.navigateToRandomExperience()
                }
            }
        }
    }
}
