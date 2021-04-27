//
//  GuessUseCase.swift
//  logic
//
//  Created by Tuan Tu Do on 22.04.2021.
//

import Combine
import Foundation

final class GuessUseCase {
    private let remoteRepository: LogicRemoteGameRepositoryType
    private let gameRepository: GameRepositoryType
    private let startGameUseCase: StartGameUseCaseType

    init(
        remoteRepository: LogicRemoteGameRepositoryType,
        gameRepository: GameRepositoryType,
        startGameUseCase: StartGameUseCaseType
    ) {
        self.remoteRepository = remoteRepository
        self.gameRepository = gameRepository
        self.startGameUseCase = startGameUseCase
    }
}

extension GuessUseCase: GuessUseCaseType {
    func guess(_ guess: [Int]) -> AnyPublisher<GuessResponse, Error> {
        Just(gameRepository.game)
            .flatMap { [unowned self] game -> AnyPublisher<Game, Error> in
                guard let game = game else {
                    return self.startGameUseCase.start(with: User.tuan)
                }

                return Just(game)
                    .mapError { $0 as Error }
                    .eraseToAnyPublisher()
            }
            .map { game in
                Guess(gameId: game.gameId, guess: guess)
            }
            .flatMap { [unowned self] guess in
                self.remoteRepository.postGuess(guess)
            }
            .eraseToAnyPublisher()
    }
}

private extension GuessUseCase {
    func guess(_ guess: Guess) -> AnyPublisher<GuessResponse, Error> {
        remoteRepository.postGuess(guess)
    }
}
