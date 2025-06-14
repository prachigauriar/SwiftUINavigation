//
//  ExperiencePickerSceneModeling.swift
//  Navigator
//
//  Created by Prachi Gauriar on 6/13/25.
//

import Foundation
import SwiftUI


protocol ExperiencePickerSceneModeling: NavigationPathProvider {
    associatedtype SomeExperiencePickerViewModel: ExperiencePickerViewModeling

    func navigate(to url: URL)
    func makeExperiencePickerViewModel() -> SomeExperiencePickerViewModel
}
