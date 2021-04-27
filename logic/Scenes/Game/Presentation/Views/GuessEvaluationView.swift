//
//  GuessEvaluationView.swift
//  logic
//
//  Created by Tuan Tu Do on 22.04.2021.
//

import Combine
import SnapKit
import UIKit

final class GuessEvaluationView: UIView {
    private let blacks: Int
    private let whites: Int
    private let buttons: [UIButton]

    init(guessedNumbers: [Int], blacks: Int, whites: Int) {
        self.blacks = blacks
        self.whites = whites
        self.buttons = guessedNumbers.map { NumberButton(number: $0) }
        super.init(frame: .zero)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        let gView = guessView

        let rootStack = UIStackView
            .horizontal
            .space(by: 5)
            .stack(gView, evaluationView)

        addSubview(rootStack)
        rootStack.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        gView.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.7)
        }
    }
}

private extension GuessEvaluationView {
    var guessView: UIView {
        let wrapper = UIView()

        let stack = UIStackView
            .horizontal
            .distribute(by: .equalSpacing)
            .stack(buttons)

        buttons.forEach { button in
            button.snp.makeConstraints { make in
                make.height.equalTo(button.snp.width)
            }
        }

        wrapper.addSubview(stack)
        stack.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(15)
            make.leading.trailing.equalToSuperview().inset(20)
        }

        return wrapper
    }

    var evaluationView: UIView {
        let wrapper = UIView()

        let stack = UIStackView
            .horizontal
            .space(by: 5)

        for _ in 0..<blacks {
            let dot = UIView()
            dot.backgroundColor = .black
            stack.addArrangedSubview(dot)
            dot.snp.makeConstraints { make in
                make.width.height.equalTo(10)
            }
            dot.layer.cornerRadius = 5
        }

        for _ in 0..<whites {
            let dot = UIView()
            dot.backgroundColor = .white
            stack.addArrangedSubview(dot)
            dot.snp.makeConstraints { make in
                make.width.height.equalTo(10)
            }
            dot.layer.borderColor = UIColor.black.cgColor
            dot.layer.borderWidth = 0.5
            dot.layer.cornerRadius = 5
        }

        wrapper.addSubview(stack)
        stack.snp.makeConstraints { make in
            make.leading.centerY.equalToSuperview()
        }

        return wrapper
    }
}
