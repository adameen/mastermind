//
//  GuessUseCaseType.swift
//  logic
//
//  Created by Tuan Tu Do on 22.04.2021.
//

import Combine
import Foundation

protocol GuessUseCaseType {
    func guess(_ guess: [Int]) -> AnyPublisher<GuessResponse, Error>
}
