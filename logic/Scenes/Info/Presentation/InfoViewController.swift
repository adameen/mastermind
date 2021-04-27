//
//  InfoViewController.swift
//  logic
//
//  Created by Tuan Tu Do on 21.04.2021.
//

import UIKit
import SnapKit

final class InfoViewController: UIViewController {
    private let viewModel: InfoViewModelType

    init(viewModel: InfoViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        presentationController?.delegate = self
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
    }

    private func setupUI() {
        let label = UILabel()
        label.text = "These are the rulez of the game"
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}

extension InfoViewController: UIAdaptivePresentationControllerDelegate {
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        viewModel.dismissed.send()
    }
}
