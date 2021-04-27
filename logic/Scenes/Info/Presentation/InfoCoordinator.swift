//
//  InfoCoordinator.swift
//  logic
//
//  Created by Tuan Tu Do on 21.04.2021.
//

import Combine
import Foundation

final class InfoCoordinator: Coordinating {
    typealias CoordinationResult = Void

    var childCoordinatorsStorage = CoordinatorStorage()

    private let router: Routing
    private let instanceProvider: InstanceProviding

    init(router: Routing, instanceProvider: InstanceProviding) {
        self.router = router
        self.instanceProvider = instanceProvider
    }

    func start() -> AnyPublisher<Void, Never> {
        let scene: Scene<InfoViewController, InfoViewModelActions> = instanceProvider.instance()
        router.present(scene.viewController)
        return scene.viewModel.dismiss.first().eraseToAnyPublisher()
    }
}
