//
//  Routing.swift
//  logic
//
//  Created by Tuan Tu Do on 21.04.2021.
//

import UIKit

protocol Routing {
    var navigationController: UINavigationController { get }
    init(navigationController: UINavigationController)
    func setRootViewController(_ viewController: UIViewController)
    func present(_ viewContoller: UIViewController, animated: Bool, completion: (() -> Void)?)
    func dismiss(animated: Bool, completion: (() -> Void)?)
    func push(_ viewController: UIViewController, animated: Bool)
}

extension Routing {
    func present(_ viewContoller: UIViewController, animated: Bool = true, completion: (() -> Void)? = nil) {
        present(viewContoller, animated: animated, completion: completion)
    }

    func dismiss(animated: Bool, completion: (() -> Void)? = nil) {
        dismiss(animated: animated, completion: completion)
    }
}
