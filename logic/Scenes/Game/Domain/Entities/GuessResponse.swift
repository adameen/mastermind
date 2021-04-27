//
//  GuessResponse.swift
//  logic
//
//  Created by Tuan Tu Do on 21.04.2021.
//

import Foundation

struct GuessResponse: Decodable {
    let evaluation: Evaluation
    let guessCount: Int
}

extension GuessResponse {
    struct Evaluation: Decodable {
        let black: Int
        let white: Int
    }
}
