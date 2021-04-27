//
//  GameRepository.swift
//  logic
//
//  Created by Tuan Tu Do on 22.04.2021.
//

import Foundation

final class GameRepository: GameRepositoryType {
    private let key = "logic.gameId"

    func save(_ game: Game) {
        UserDefaults.standard.setValue(game.gameId, forKey: key)
    }

    var game: Game? {
        guard let gameId = UserDefaults.standard.string(forKey: key) else {
            return nil
        }

        return Game(gameId: gameId)
    }
}
