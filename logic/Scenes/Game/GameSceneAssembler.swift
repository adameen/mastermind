//
//  GameSceneAssembler.swift
//  logic
//
//  Created by Tuan Tu Do on 21.04.2021.
//

import Resolver

extension Resolver {
    static func registerGameScene() {
        registerGameSceneData()
        registerGameSceneDomain()
        registerGameScenePresentation()
    }
}

private extension Resolver {
    static func registerGameScenePresentation() {
        register { GameViewModel(startGameUseCase: resolve(), guessUseCase: resolve()) }
            .implements(GameViewModelType.self)
            .implements(GameViewModelActions.self)

        register { GameViewController(viewModel: resolve()) }

        register {
            Scene<GameViewController, GameViewModelActions>(
                viewController: resolve(),
                viewModel: resolve()
            )
        }
    }

    static func registerGameSceneDomain() {
        register { StartGameUseCase(remoteRepository: resolve(), gameRepository: resolve()) }
            .implements(StartGameUseCaseType.self)

        register {
            GuessUseCase(remoteRepository: resolve(), gameRepository: resolve(), startGameUseCase: resolve())
        }.implements(GuessUseCaseType.self)
    }

    static func registerGameSceneData() {
        register { LogicRemoteGameRepository() }
            .implements(LogicRemoteGameRepositoryType.self)

        register { GameRepository() }
            .implements(GameRepositoryType.self)
    }
}
