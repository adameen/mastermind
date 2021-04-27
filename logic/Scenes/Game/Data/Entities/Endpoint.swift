//
//  Endpoint.swift
//  logic
//
//  Created by Tuan Tu Do on 21.04.2021.
//

import Foundation

enum Endpoint: String {
    case start = "/start"
    case guess = "/guess"
}

extension Endpoint {
    var baseUrlString: String { "https://hravahlava.etnetera.cz" }
    var urlString: String { baseUrlString + rawValue }
}
