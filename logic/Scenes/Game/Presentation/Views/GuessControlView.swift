//
//  GuessControlView.swift
//  logic
//
//  Created by Tuan Tu Do on 21.04.2021.
//

import Combine
import UIKit
import SnapKit

final class GuessControlView: UIView {
    var numberTapped: AnyPublisher<Int, Never> {
        numberTappedSubject.eraseToAnyPublisher()
    }

    private var numberTappedSubject = PassthroughSubject<Int, Never>()
    private var cancellables = Set<AnyCancellable>()

    init() {
        super.init(frame: .zero)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        let rootStack = UIStackView.horizontal.distribute(by: .equalSpacing)
        addSubview(rootStack)
        rootStack.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        (1...5).forEach { number in
            let button = NumberButton(number: number)
            rootStack.addArrangedSubview(button)
            button.snp.makeConstraints { make in
                make.height.equalTo(button.snp.width)
            }

            button.tap
                .sink { [weak self] _ in
                    self?.numberTappedSubject.send(number)
                }
                .store(in: &cancellables)
        }
    }
}
