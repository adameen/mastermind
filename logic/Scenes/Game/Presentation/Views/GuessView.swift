//
//  GuessView.swift
//  logic
//
//  Created by Tuan Tu Do on 21.04.2021.
//

import Combine
import UIKit
import SnapKit

final class GuessView: UIView {
    private let guessCountLabel = UILabel()
    private let buttons: [NumberButton] = (0...4).map { _ in NumberButton(number: 0) }

    init() {
        super.init(frame: .zero)
        setupUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func set(guessCount: Int) {
        guessCountLabel.text = "\(guessCount)"
    }

    func set(numbers: [Int]) {
        for (index, button) in buttons.enumerated() {
            button.set(number: numbers[index])
        }
    }
}

private extension GuessView {
    func setupUI() {
        let gView = guessView

        let stack = UIStackView
            .horizontal
            .space(by: 5)
            .stack(gView, labelView)

        gView.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.7)
        }

        addSubview(stack)
        stack.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    var guessView: UIView {
        let wrapper = UIView()

        wrapper.backgroundColor = UIColor(displayP3Red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
        wrapper.layer.cornerRadius = 20

        let rootStack = UIStackView
            .horizontal
            .distribute(by: .equalSpacing)
            .stack(buttons)

        wrapper.addSubview(rootStack)
        rootStack.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(15)
            make.leading.trailing.equalToSuperview().inset(20)
        }

        buttons.forEach { button in
            button.snp.makeConstraints { make in
                make.height.equalTo(button.snp.width)
            }
        }

        return wrapper
    }

    var labelView: UIView {
        let wrapper = UIView()
        wrapper.addSubview(guessCountLabel)
        guessCountLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        guessCountLabel.textAlignment = .right

        return wrapper
    }
}
