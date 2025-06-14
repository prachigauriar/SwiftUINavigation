//
//  ExperiencePickerScene.swift
//  Navigator
//
//  Created by Prachi Gauriar on 6/13/25.
//

import Foundation
import SwiftUI


struct ExperiencePickerScene<SceneModel>: Scene where SceneModel: ExperiencePickerSceneModeling {
    @State var sceneModel: SceneModel


    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $sceneModel.navigationPath) {
                ExperiencePicker(viewModel: sceneModel.makeExperiencePickerViewModel())
            }
            .onOpenURL { (url) in
                sceneModel.navigate(to: url)
            }
        }
    }
}
