//
//  NotchApperance.swift
//  GoodNotch
//
//  Created by Denis Ronchese on 13/11/24.
//

import SwiftUI

struct NotchAppearance {
    let backgroundColor: Color
    let foregroundColor: Color
    let opacity: Double
    
    static let `default` = NotchAppearance(
        backgroundColor: Color(nsColor: .black),
        foregroundColor: Color(nsColor: .white),
        opacity: 1.0
    )
}
