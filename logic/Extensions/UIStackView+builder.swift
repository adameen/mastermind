//
//  UIStackView+builder.swift
//  logic
//
//  Created by Tuan Tu Do on 21.04.2021.
//

import UIKit

extension UIStackView {
    static var vertical: UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical

        return stackView
    }

    static var horizontal: UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal

        return stackView
    }

    func align(by alignment: UIStackView.Alignment) -> UIStackView {
        self.alignment = alignment

        return self
    }

    func distribute(by distribution: UIStackView.Distribution) -> UIStackView {
        self.distribution = distribution

        return self
    }

    func space(by spacing: CGFloat) -> UIStackView {
        self.spacing = spacing

        return self
    }

    func stack(_ views: UIView...) -> UIStackView {
        views.forEach { [weak self] view in
            self?.addArrangedSubview(view)
        }

        return self
    }

    func stack(_ views: [UIView]) -> UIStackView {
        views.forEach { [weak self] view in
            self?.addArrangedSubview(view)
        }

        return self
    }
}
