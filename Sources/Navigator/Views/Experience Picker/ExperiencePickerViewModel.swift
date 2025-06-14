//
//  ExperiencePickerViewModel.swift
//  Navigator
//
//  Created by Prachi Gauriar on 6/12/25.
//

import Foundation
import SwiftUI


@Observable
final class ExperiencePickerViewModel: ExperiencePickerViewModeling {
    var navigationPathProvider: any NavigationPathProvider
    let productDataSource = ProductDataSource()


    init(navigationPathProvider: any NavigationPathProvider) {
        self.navigationPathProvider = navigationPathProvider
    }


    func navigateToRandomExperience() {
        let experience = [Experience.productGrid, .productList].randomElement()!
        navigationPathProvider.navigationPath.append(experience)
    }


    func navigate(to url: URL) {
        guard url.scheme == "navigator" else {
            return
        }

        var pathComponents = url.pathComponents
        guard pathComponents.count > 1 else {
            return
        }

        // Drop the leading /
        pathComponents.removeFirst()

        let firstComponent = pathComponents.removeFirst()
        switch firstComponent {
        case "grid":
            navigationPathProvider.navigationPath.clearAndAppend(Experience.productGrid)
        case "list":
            navigationPathProvider.navigationPath.clearAndAppend(Experience.productList)
        default:
            return
        }

        guard !pathComponents.isEmpty else {
            return
        }

        let id = pathComponents.removeFirst()
        navigationPathProvider.navigationPath.append(ProductID(rawValue: id))
    }


    func makeProductGridViewModel() -> some ProductGridViewModeling {
        return ProductGridViewModel(productDataSource: productDataSource)
    }


    func makeProductListViewModel() -> some ProductListViewModeling {
        return ProductListViewModel(productDataSource: productDataSource)
    }
}
