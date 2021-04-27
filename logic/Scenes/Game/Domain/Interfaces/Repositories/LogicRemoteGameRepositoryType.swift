//
//  LogicRemoteGameRepositoryType.swift
//  logic
//
//  Created by Tuan Tu Do on 21.04.2021.
//

import Combine
import Foundation

protocol LogicRemoteGameRepositoryType {
    func postStart(user: User) -> AnyPublisher<Game, Error>
    func postGuess(_ guess: Guess) -> AnyPublisher<GuessResponse, Error>
}
