//
//  Assembler.swift
//  logic
//
//  Created by Tuan Tu Do on 21.04.2021.
//

import Resolver

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        registerGameScene()
        registerInfoScene()
    }
}
