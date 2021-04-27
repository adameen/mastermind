//
//  User.swift
//  logic
//
//  Created by Tuan Tu Do on 21.04.2021.
//

import Foundation

struct User: Encodable {
    let nickname: String
    let email: String
    let slots: Int
}

extension User {
    static var tuan = User(nickname: "etn-tuan", email: "tuantu.do@etnetera.cz", slots: 5)
}
