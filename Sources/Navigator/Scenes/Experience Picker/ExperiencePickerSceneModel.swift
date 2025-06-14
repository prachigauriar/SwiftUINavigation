//
//  ExperiencePickerSceneModel.swift
//  Navigator
//
//  Created by Prachi Gauriar on 6/13/25.
//

import Foundation
import SwiftUI


@Observable
final class ExperiencePickerSceneModel: ExperiencePickerSceneModeling {
    var navigationPath = NavigationPath()


    func makeExperiencePickerViewModel() -> some ExperiencePickerViewModeling {
        return ExperiencePickerViewModel(navigationPathProvider: self)
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
            navigationPath.clearAndAppend(Experience.productGrid)
        case "list":
            navigationPath.clearAndAppend(Experience.productList)
        default:
            return
        }

        guard !pathComponents.isEmpty else {
            return
        }

        let id = pathComponents.removeFirst()
        navigationPath.append(ProductID(rawValue: id))
    }
}
