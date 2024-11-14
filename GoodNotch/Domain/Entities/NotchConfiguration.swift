//
//  NotchConfiguration.swift
//  GoodNotch
//
//  Created by Denis Ronchese on 13/11/24.
//

import Foundation
import SwiftUI

struct NotchConfiguration {
    struct Size {
        let width: CGFloat
        let height: CGFloat
    }
    
    struct Appearance {
        let backgroundColor: Color
        let foregroundColor: Color
        let opacity: Double
    }
    
    let openSize: Size
    let closedSize: Size
    let cornerRadius: CGFloat
    let appearance: Appearance
    
    static let `default` = NotchConfiguration(
        openSize: Size(width: 190, height: 64),
        closedSize: Size(width: 190, height: 32),
        cornerRadius: 10,
        appearance: Appearance(backgroundColor: .black, foregroundColor: .white, opacity: 1.0)
    )
}
