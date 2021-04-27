//
//  InfoSceneAssembler.swift
//  logic
//
//  Created by Tuan Tu Do on 21.04.2021.
//

import Resolver

extension Resolver {
    static func registerInfoScene() {
        registerInfoSceneData()
        registerInfoSceneDomain()
        registerInfoScenePresentation()
    }
}

private extension Resolver {
    static func registerInfoScenePresentation() {
        register { InfoViewModel() }
            .implements(InfoViewModelType.self)
            .implements(InfoViewModelActions.self)

        register { InfoViewController(viewModel: resolve()) }

        register {
            Scene<InfoViewController, InfoViewModelActions>(
                viewController: resolve(),
                viewModel: resolve()
            )
        }
    }

    static func registerInfoSceneDomain() {

    }

    static func registerInfoSceneData() {

    }
}

