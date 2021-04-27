//
//  Guess.swift
//  logic
//
//  Created by Tuan Tu Do on 21.04.2021.
//

import Foundation

struct Guess: Encodable {
    let gameId: String
    let guess: [Int]
}
