//
//  NotchState.swift
//  GoodNotch
//
//  Created by Denis Ronchese on 13/11/24.
//

import Foundation
import CoreGraphics

enum NotchState {
    case open(NotchOpenDirection)
    case closed
}

enum NotchOpenDirection {
    case left
    case right
    // case leftRight
    case bottom
    case leftBottom
    case rightBottom
    case all
}

enum NotchView {
    case home
    case shelf
}
