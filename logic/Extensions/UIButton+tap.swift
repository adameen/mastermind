//
//  UIButton+tap.swift
//  logic
//
//  Created by Tuan Tu Do on 21.04.2021.
//

import Combine
import UIKit

extension UIButton {
    /// Publisher that emits `Void`, when the user triggers touchUpInside event.
    var tap: AnyPublisher<Void, Never> {
        publisher(for: .touchUpInside)
    }
}
