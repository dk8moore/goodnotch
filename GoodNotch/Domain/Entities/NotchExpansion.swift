//
//  NotchExpansion.swift
//  GoodNotch
//
//  Created by Denis Ronchese on 15/11/24.
//

import SwiftUI
import AppKit

struct NotchExpansion {
    let size: NotchConfiguration.Size
    let origin: CGPoint
    
    static func calculate(
        for direction: NotchOpenDirection,
        baseConfig: NotchConfiguration,
        screenFrame: CGRect
    ) -> NotchExpansion {
        // Calculate the base center position
        let baseCenterX = (screenFrame.width - baseConfig.closedSize.width) / 2
        let baseY = screenFrame.maxY - baseConfig.closedSize.height
        
        switch direction {
        case .left:
            let width = baseConfig.openSize.width * 1.5
            return NotchExpansion(
                size: .init(width: width, height: baseConfig.openSize.height),
                origin: .init(x: baseCenterX - (width - baseConfig.closedSize.width), y: baseY)
            )
            
        case .right:
            return NotchExpansion(
                size: .init(width: baseConfig.openSize.width * 1.5, height: baseConfig.openSize.height),
                origin: .init(x: baseCenterX, y: baseY)
            )
            
        case .bottom:
            return NotchExpansion(
                size: .init(width: baseConfig.openSize.width, height: baseConfig.openSize.height * 1.5),
                origin: .init(x: baseCenterX, y: baseY - (baseConfig.openSize.height * 0.5))
            )
            
        case .leftBottom:
            let width = baseConfig.openSize.width * 1.5
            let height = baseConfig.openSize.height * 1.5
            return NotchExpansion(
                size: .init(width: width, height: height),
                origin: .init(
                    x: baseCenterX - (width - baseConfig.closedSize.width),
                    y: baseY - (height - baseConfig.closedSize.height)
                )
            )
            
        case .rightBottom:
            let width = baseConfig.openSize.width * 1.5
            let height = baseConfig.openSize.height * 1.5
            return NotchExpansion(
                size: .init(width: width, height: height),
                origin: .init(x: baseCenterX, y: baseY - (height - baseConfig.closedSize.height))
            )
            
        case .all:
            let width = baseConfig.openSize.width * 2
            let height = baseConfig.openSize.height * 2
            return NotchExpansion(
                size: .init(width: width, height: height),
                origin: .init(
                    x: baseCenterX - (width - baseConfig.closedSize.width) / 2,
                    y: baseY - (height - baseConfig.closedSize.height)
                )
            )
        }
    }
}
