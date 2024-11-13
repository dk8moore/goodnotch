//
//  NotchConfiguration.swift
//  GoodNotch
//
//  Created by Denis Ronchese on 13/11/24.
//

import Foundation

struct NotchConfiguration {
    struct Size {
        let width: CGFloat
        let height: CGFloat
    }
    
    let openSize: Size
    let closedSize: Size
    let cornerRadius: CGFloat
    
    static let `default` = NotchConfiguration(
        openSize: Size(width: 190, height: 64),
        closedSize: Size(width: 190, height: 32),
        cornerRadius: 10
    )
}
