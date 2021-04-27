//
//  InstanceProvider.swift
//  logic
//
//  Created by Tuan Tu Do on 21.04.2021.
//

import Foundation
import Resolver

final class InstanceProvider: Resolving, InstanceProviding {
    func instance<T>(_ type: T.Type = T.self) -> T {
        resolver.resolve(type)
    }
}
