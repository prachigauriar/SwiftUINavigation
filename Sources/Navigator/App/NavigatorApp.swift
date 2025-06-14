//
//  NavigatorApp.swift
//  Navigator
//
//  Created by Prachi Gauriar on 6/12/25.
//

import SwiftUI


@main
struct NavigatorApp: App {
    var appModel: NavigatorAppModel = .init()


    var body: some Scene {
        ExperiencePickerScene(sceneModel: appModel.makeExperiencePickerSceneModel())
    }
}
