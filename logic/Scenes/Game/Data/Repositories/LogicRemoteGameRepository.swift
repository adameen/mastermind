//
//  LogicRemoteGameRepository.swift
//  logic
//
//  Created by Tuan Tu Do on 21.04.2021.
//

import Combine
import Foundation

final class LogicRemoteGameRepository: LogicRemoteGameRepositoryType {
    func postStart(user: User) -> AnyPublisher<Game, Error> {
        Just(user)
            .encode(encoder: JSONEncoder())
            .map { [unowned self] data in
                self.createPostRequest(data: data, endpoint: .start)
            }
            .flatMap { urlRequest in
                URLSession.shared.dataTaskPublisher(for: urlRequest)
                    .map(\.data)
                    .decode(type: Game.self, decoder: JSONDecoder())
            }
            .eraseToAnyPublisher()
    }

    func postGuess(_ guess: Guess) -> AnyPublisher<GuessResponse, Error> {
        Just(guess)
            .encode(encoder: JSONEncoder())
            .map { [unowned self] data in
                self.createPostRequest(data: data, endpoint: .guess)
            }
            .flatMap { urlRequest in
                URLSession.shared.dataTaskPublisher(for: urlRequest)
                    .map(\.data)
                    .decode(type: GuessResponse.self, decoder: JSONDecoder())
            }
            .eraseToAnyPublisher()
    }
}

private extension LogicRemoteGameRepository {
    func createPostRequest(data: Data, endpoint: Endpoint) -> URLRequest {
        var urlRequest = URLRequest(url: URL(string: endpoint.urlString)!)
        urlRequest.httpMethod = "POST"
        urlRequest.httpBody = data
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")

        return urlRequest
    }
}
