//
//  NumberButton.swift
//  logic
//
//  Created by Tuan Tu Do on 21.04.2021.
//

import Combine
import UIKit
import SnapKit

final class NumberButton: UIButton {
    init(number: Int = 0) {
        super.init(frame: .zero)
        set(number: number)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.size.width / 2
    }

    func set(number: Int) {
        setTitle("\(number)", for: .normal)
        setTitleColor(.white, for: .normal)
        switch number {
        case 1:
            backgroundColor = .black
        case 2:
            backgroundColor = UIColor(displayP3Red: 52/255, green: 120/255, blue: 246/255, alpha: 1)
        case 3:
            backgroundColor = UIColor(displayP3Red: 101/255, green: 196/255, blue: 102/255, alpha: 1)
        case 4:
            backgroundColor = UIColor(displayP3Red: 237/255, green: 67/255, blue: 90/255, alpha: 1)
        case 5:
            backgroundColor = UIColor(displayP3Red: 240/255, green: 154/255, blue: 55/255, alpha: 1)
        default:
            backgroundColor = .gray
        }
    }
}
