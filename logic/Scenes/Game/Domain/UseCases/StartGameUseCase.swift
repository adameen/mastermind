//
//  StartGameUseCase.swift
//  logic
//
//  Created by Tuan Tu Do on 22.04.2021.
//

import Combine
import Foundation

final class StartGameUseCase {
    private let remoteRepository: LogicRemoteGameRepositoryType
    private let gameRepository: GameRepositoryType

    init(remoteRepository: LogicRemoteGameRepositoryType, gameRepository: GameRepositoryType) {
        self.remoteRepository = remoteRepository
        self.gameRepository = gameRepository
    }
}

extension StartGameUseCase: StartGameUseCaseType {
    func start(with user: User) -> AnyPublisher<Game, Error> {
        remoteRepository.postStart(user: user)
            .map { [unowned self] game in
                self.gameRepository.save(game)
                return game
            }
            .eraseToAnyPublisher()
    }
}
