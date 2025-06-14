//
//  NavigatorAppModel.swift
//  Navigator
//
//  Created by Prachi Gauriar on 6/12/25.
//

import Foundation


@Observable
final class NavigatorAppModel: NavigatorAppModeling {
    func makeExperiencePickerSceneModel() -> ExperiencePickerSceneModel {
        return ExperiencePickerSceneModel()
    }
}
