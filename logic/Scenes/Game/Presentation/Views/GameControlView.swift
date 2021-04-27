//
//  GameControlView.swift
//  logic
//
//  Created by Tuan Tu Do on 21.04.2021.
//

import Combine
import UIKit

final class GameControlView: UIView {
    var newGameTapped: AnyPublisher<Void, Never> { newGameButton.tap }
    var cleanGuessTapped: AnyPublisher<Void, Never> { cleanGuessButton.tap }
    var guessTapped: AnyPublisher<Void, Never> { guessButton.tap }

    private let newGameButton = UIButton()
    private let cleanGuessButton = UIButton()
    private let guessButton = UIButton()

    init() {
        super.init(frame: .zero)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        setupNewGameButton()
        setupCleanGuessButton()
        setupGuessButton()

        let rootStack = UIStackView
            .horizontal
            .distribute(by: .equalSpacing)
            .stack(newGameButton, cleanGuessButton, guessButton)

        addSubview(rootStack)

        rootStack.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    private func setupNewGameButton() {
        newGameButton.setTitle("New game", for: .normal)
        newGameButton.setTitleColor(
            UIColor(displayP3Red: 237/255, green: 67/255, blue: 90/255, alpha: 1), for: .normal
        )
    }

    private func setupCleanGuessButton() {
        cleanGuessButton.setTitle("Clean guess", for: .normal)
        cleanGuessButton.setTitleColor(
            UIColor(displayP3Red: 52/255, green: 120/255, blue: 246/255, alpha: 1), for: .normal
        )
    }

    private func setupGuessButton() {
        guessButton.setTitle("Guess", for: .normal)
        guessButton.setTitleColor(
            UIColor(displayP3Red: 101/255, green: 196/255, blue: 102/255, alpha: 1), for: .normal
        )
    }
}
