//
//  Router.swift
//  logic
//
//  Created by Tuan Tu Do on 21.04.2021.
//

import UIKit

final class Router: Routing {
    let navigationController: UINavigationController

    init(navigationController: UINavigationController = UINavigationController()) {
        self.navigationController = navigationController
    }

    func setRootViewController(_ viewController: UIViewController) {
        navigationController.setViewControllers([viewController], animated: false)
    }

    func present(
        _ viewContoller: UIViewController,
        animated: Bool,
        completion: (() -> Void)?
    ) {
        navigationController.present(viewContoller, animated: animated, completion: completion)
    }

    func dismiss(animated: Bool, completion: (() -> Void)?) {
        navigationController.dismiss(animated: animated, completion: completion)
    }

    func push(_ viewController: UIViewController, animated: Bool) {
        navigationController.pushViewController(viewController, animated: animated)
    }
}
