//
//  GameViewModel.swift
//  logic
//
//  Created by Tuan Tu Do on 19.04.2021.
//

import Combine
import Foundation

final class GameViewModel: GameViewModelType {
    var clearEvaluation: AnyPublisher<Void, Never> {
        // TODO: implement
        Empty(completeImmediately: false).eraseToAnyPublisher()
    }

    var evaluation: AnyPublisher<([Int], Int, Int), Never> {
        // TODO: implement
        Empty(completeImmediately: false).eraseToAnyPublisher()
    }

    var guessCount: AnyPublisher<Int, Never> {
        // TODO: implement
        // prepend 0
        Empty(completeImmediately: false).eraseToAnyPublisher()
    }

    var selectedNumbers: AnyPublisher<[Int], Never> {
        addGuess
            .merge(with: clearGuess)
            .merge(with: newGame)
            .eraseToAnyPublisher()
    }

    let newGameTapped = PassthroughSubject<Void, Never>()
    let cleanGuessTapped = PassthroughSubject<Void, Never>()
    let guessTapped = PassthroughSubject<Void, Never>()
    let infoTapped = PassthroughSubject<Void, Never>()
    let numberTapped = PassthroughSubject<Int, Never>()

    private var currentGuess = [0, 0, 0, 0, 0]
    private var cancellables = Set<AnyCancellable>()

    private let startGameUseCase: StartGameUseCaseType
    private let guessUseCase: GuessUseCaseType

    init(startGameUseCase: StartGameUseCaseType, guessUseCase: GuessUseCaseType) {
        self.startGameUseCase = startGameUseCase
        self.guessUseCase = guessUseCase
    }
}

extension GameViewModel: GameViewModelActions {
    var showInfo: AnyPublisher<Void, Never> {
        infoTapped.eraseToAnyPublisher()
    }
}

private extension GameViewModel {
    var addGuess: AnyPublisher<[Int], Never> {
        numberTapped
            .map { [unowned self] number -> [Int] in
                guard let index = self.currentGuess.firstIndex(where: { $0 == 0 }) else {
                    return self.currentGuess
                }
                self.currentGuess[index] = number
                return self.currentGuess
            }
            .eraseToAnyPublisher()
    }

    var clearGuess: AnyPublisher<[Int], Never> {
        cleanGuessTapped
            .map { [unowned self] _  -> [Int] in
                self.currentGuess = [0, 0, 0, 0, 0]
                return self.currentGuess
            }
            .eraseToAnyPublisher()
    }

    var newGame: AnyPublisher<[Int], Never> {
        newGameTapped
            .flatMap { [unowned self] _ in
                self.startGameUseCase.start(with: User.tuan).print()
            }
            .eraseType()
            .flatMap { [unowned self] _ in
                self.clearGuess
            }
            .replaceError(with: [0, 0, 0, 0, 0])
            .eraseToAnyPublisher()
    }
}
