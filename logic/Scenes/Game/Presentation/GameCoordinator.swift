//
//  GameCoordinator.swift
//  logic
//
//  Created by Tuan Tu Do on 19.04.2021.
//

import Combine
import Foundation
import UIKit

final class GameCoordinator: Coordinating {
    typealias CoordinationResult = Void

    let childCoordinatorsStorage = CoordinatorStorage()

    private let router: Routing
    private let instanceProvider: InstanceProviding
    private var cancellables = Set<AnyCancellable>()

    init(router: Routing, instanceProvider: InstanceProviding) {
        self.router = router
        self.instanceProvider = instanceProvider
    }

    func start() -> AnyPublisher<Void, Never> {
        let scene: Scene<GameViewController, GameViewModelActions> = instanceProvider.instance()
        router.setRootViewController(scene.viewController)
        handleGameSceneActions(viewModel: scene.viewModel)
        return Empty(completeImmediately: false).eraseToAnyPublisher()
    }
}

private extension GameCoordinator {
    func handleGameSceneActions(viewModel: GameViewModelActions) {
        viewModel.showInfo
            .flatMap { [unowned self] in
                self.coordinate(to: InfoCoordinator(router: self.router, instanceProvider: self.instanceProvider))
            }
            .sink()
            .store(in: &cancellables)
    }
}
