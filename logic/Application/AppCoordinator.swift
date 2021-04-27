//
//  AppCoordinator.swift
//  logic
//
//  Created by Tuan Tu Do on 19.04.2021.
//

import Combine
import Foundation
import UIKit

final class AppCoordinator: Coordinating {
    typealias CoordinationResult = Void

    let childCoordinatorsStorage = CoordinatorStorage()

    private let window: UIWindow?
    private let instanceProvider: InstanceProviding = InstanceProvider()
    private let router = Router()

    init(window: UIWindow?) {
        self.window = window
    }
    
    func start() -> AnyPublisher<Void, Never> {
        window?.rootViewController = router.navigationController
        return coordinateToGame
    }
}

private extension AppCoordinator {
    var coordinateToGame: AnyPublisher<GameCoordinator.CoordinationResult, Never> {
        coordinate(to: GameCoordinator(router: router, instanceProvider: instanceProvider))
    }
}
