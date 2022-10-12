//
//  User.swift
//  SwipeableCards
//
//  Created by Carlos Henrique Pereira do Carmo on 11/10/22.
//

import Foundation
import SwiftUI

struct User: Identifiable, Equatable {
    static func == (lhs: User, rhs: User) -> Bool {
        lhs.id == rhs.id
    }

    var id: Int
    let firstName: String
    let lastName: String
    let start: Color
    let end: Color
}
