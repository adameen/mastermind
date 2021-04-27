//
//  Publisher+eraseType.swift
//  logic
//
//  Created by Tuan Tu Do on 22.04.2021.
//

import Combine
import Foundation

extension Publisher {
    func eraseType() -> Publishers.Map<Self, Void>{
        map { _ in return () }
    }
}
