//
//  InfoViewModel.swift
//  logic
//
//  Created by Tuan Tu Do on 21.04.2021.
//

import Combine
import Foundation

final class InfoViewModel: InfoViewModelType {
    let dismissed = PassthroughSubject<Void, Never>()
}

extension InfoViewModel: InfoViewModelActions {
    var dismiss: AnyPublisher<Void, Never> {
        dismissed.eraseToAnyPublisher()
    }
}
