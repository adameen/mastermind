//
//  StartGameUseCase.swift
//  logic
//
//  Created by Tuan Tu Do on 22.04.2021.
//

import Combine
import Foundation

protocol StartGameUseCaseType {
    func start(with user: User) -> AnyPublisher<Game, Error>
}
