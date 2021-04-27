//
//  InstanceProviding.swift
//  logic
//
//  Created by Tuan Tu Do on 21.04.2021.
//

import Foundation

protocol InstanceProviding {
    func instance<T>(_ type: T.Type) -> T
}

extension InstanceProviding {
    func instance<T>(_ type: T.Type = T.self) -> T {
        instance(type)
    }
}
