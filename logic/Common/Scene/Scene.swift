//
//  Scene.swift
//  logic
//
//  Created by Tuan Tu Do on 21.04.2021.
//

import UIKit

struct Scene<VC: UIViewController, VM> {
    let viewController: VC
    let viewModel: VM
}
