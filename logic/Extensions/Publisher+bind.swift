//
//  Publisher+bind.swift
//  logic
//
//  Created by Tuan Tu Do on 22.04.2021.
//

import Combine

extension Publisher where Self.Failure == Never {
    func bind(to subject: PassthroughSubject<Self.Output, Self.Failure>) -> AnyCancellable {
        sink { [weak subject] output in
            guard let subject = subject else { return }
            subject.send(output)
        }
    }
}
