//
//  Coordinating.swift
//  logic
//
//  Created by Tuan Tu Do on 19.04.2021.
//

import Combine

protocol Coordinating: class {
    associatedtype CoordinationResult

    var childCoordinatorsStorage: CoordinatorStorage { get }

    func start() -> AnyPublisher<CoordinationResult, Never>
    func stop()
}

extension Coordinating {
    func coordinate<T: Coordinating>(to coordinator: T) -> AnyPublisher<T.CoordinationResult, Never> {
        store(coordinator: coordinator)

        return coordinator.start()
            .handleEvents(receiveCompletion: { [weak self] _ in
                self?.remove(coordinator: coordinator)
            })
            .eraseToAnyPublisher()
    }

    func stop() {
        childCoordinatorsStorage.removeAll()
    }
}

private extension Coordinating {
    func store<T: Coordinating>(coordinator: T) {
        childCoordinatorsStorage.append(coordinator)
    }

    func remove<T: Coordinating>(coordinator: T) {
        childCoordinatorsStorage.remove(coordinator)
    }
}
