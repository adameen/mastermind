//
//  GameViewController.swift
//  logic
//
//  Created by Tuan Tu Do on 19.04.2021.
//

import Combine
import SnapKit
import UIKit

final class GameViewController: UIViewController {
    private let guessView = GuessView()
    private let guessControlView = GuessControlView()
    private let gameControlView = GameControlView()
    private let evaluationView = EvaluationView()

    private let viewModel: GameViewModelType
    private var cancellables = Set<AnyCancellable>()

    init(viewModel: GameViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Logic Game"
        view.backgroundColor = .systemBackground

        setupNavigationBar()
        setupUI()
        setupInputBindings()
        setupOutputBindings()
    }
}

private extension GameViewController {
    func setupInputBindings() {
        guessControlView.numberTapped
            .bind(to: viewModel.numberTapped)
            .store(in: &cancellables)

        gameControlView.cleanGuessTapped
            .bind(to: viewModel.cleanGuessTapped)
            .store(in: &cancellables)

        gameControlView.newGameTapped
            .bind(to: viewModel.newGameTapped)
            .store(in: &cancellables)

        gameControlView.guessTapped
            .bind(to: viewModel.guessTapped)
            .store(in: &cancellables)
    }

    func setupOutputBindings() {
        viewModel.selectedNumbers
            .receive(on: DispatchQueue.main)
            .sink { [weak self] numbers in
                self?.guessView.set(numbers: numbers)
            }
            .store(in: &cancellables)

        viewModel.guessCount
            .receive(on: DispatchQueue.main)
            .sink { [weak self] count in
                self?.guessView.set(guessCount: count)
            }
            .store(in: &cancellables)

        viewModel.evaluation
            .receive(on: DispatchQueue.main)
            .sink { [weak self] numbers, blacks, whites in
                self?.evaluationView.add(guessedNumbers: numbers, blacks: blacks, whites: whites)
            }
            .store(in: &cancellables)
    }
}

private extension GameViewController {
    func setupUI() {
        let rootStack = UIStackView
            .vertical
            .space(by: 30)
            .stack(guessView, evaluationView, guessControlView, gameControlView)

        view.addSubview(rootStack)
        rootStack.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(30)
            make.leading.trailing.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(40)
        }
    }

    func setupNavigationBar() {
        let infoButton = UIButton(type: .infoLight)
        infoButton.tap
            .bind(to: viewModel.infoTapped)
            .store(in: &cancellables)

        let barButton = UIBarButtonItem(customView: infoButton)
        navigationItem.rightBarButtonItem = barButton
    }
}
