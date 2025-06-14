//
//  NavigatorAppModeling.swift
//  Navigator
//
//  Created by Prachi Gauriar on 6/13/25.
//

import Foundation
import SwiftUI


@MainActor
protocol NavigatorAppModeling: Observable {
    associatedtype SomeExperiencePickerSceneModel: ExperiencePickerSceneModeling

    func makeExperiencePickerSceneModel() -> SomeExperiencePickerSceneModel
}
