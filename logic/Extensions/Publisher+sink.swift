//
//  Publisher+sink.swift
//  logic
//
//  Created by Tuan Tu Do on 21.04.2021.
//

import Combine

extension Publisher {
    func sink() -> AnyCancellable {
        sink(receiveCompletion: { _ in }, receiveValue: { _ in })
    }
}
