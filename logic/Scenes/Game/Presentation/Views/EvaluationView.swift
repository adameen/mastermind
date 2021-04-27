//
//  EvaluationView.swift
//  logic
//
//  Created by Tuan Tu Do on 22.04.2021.
//

import Combine
import UIKit

final class EvaluationView: UIScrollView {
    private let rootStack = UIStackView.vertical.space(by: 5)

    init() {
        super.init(frame: .zero)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func add(guessedNumbers: [Int], blacks: Int, whites: Int) {
        let coloredView = GuessEvaluationView(guessedNumbers: guessedNumbers, blacks: blacks, whites: whites)
        rootStack.addArrangedSubview(coloredView)
    }

    private func setup() {
        addSubview(rootStack)
        rootStack.snp.makeConstraints { make in
            make.edges.width.equalToSuperview()
        }
    }
}
