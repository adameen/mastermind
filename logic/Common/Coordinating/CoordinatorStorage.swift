//
//  CoordinatorStorage.swift
//  logic
//
//  Created by Tuan Tu Do on 19.04.2021.
//

import Foundation

final class CoordinatorStorage {
    private var coordinators: [AnyObject] = []

    func append(_ coordinator: AnyObject) {
        coordinators.append(coordinator)
    }

    func remove(_ coordinator: AnyObject) {
        coordinators.removeAll { $0 === coordinator }
    }

    func removeAll() {
        coordinators.removeAll()
    }
}
