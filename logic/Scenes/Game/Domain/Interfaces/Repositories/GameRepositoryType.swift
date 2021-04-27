//
//  GameRepositoryType.swift
//  logic
//
//  Created by Tuan Tu Do on 22.04.2021.
//

import Foundation

protocol GameRepositoryType {
    func save(_ game: Game)
    var game: Game? { get }
}
