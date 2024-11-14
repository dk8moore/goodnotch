//
//  NotchShape.swift
//  GoodNotch
//
//  Created by Denis Ronchese on 13/11/24.
//

import SwiftUI

struct NotchShape: Shape {
    var bottomCornerRadius: CGFloat
    var topCornerRadius: CGFloat
    
    init(cornerRadius: CGFloat = 10) {
        self.bottomCornerRadius = cornerRadius
        self.topCornerRadius = cornerRadius > 15 ? cornerRadius - 5 : 5
    }
    
    var animatableData: CGFloat {
        get { bottomCornerRadius }
        set { bottomCornerRadius = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // Start from top left
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        // Top left curve
        path.addQuadCurve(
            to: CGPoint(x: rect.minX + topCornerRadius, y: topCornerRadius),
            control: CGPoint(x: rect.minX + topCornerRadius, y: rect.minY)
        )
        // Left vertical line
        path.addLine(to: CGPoint(x: rect.minX + topCornerRadius, y: rect.maxY - bottomCornerRadius))
        // Bottom left corner
        path.addQuadCurve(
            to: CGPoint(x: rect.minX + topCornerRadius + bottomCornerRadius, y: rect.maxY),
            control: CGPoint(x: rect.minX + topCornerRadius, y: rect.maxY)
        )
        // Bottom edge
        path.addLine(to: CGPoint(x: rect.maxX - topCornerRadius - bottomCornerRadius, y: rect.maxY))
        // Bottom right corner
        path.addQuadCurve(
            to: CGPoint(x: rect.maxX - topCornerRadius, y: rect.maxY - bottomCornerRadius),
            control: CGPoint(x: rect.maxX - topCornerRadius, y: rect.maxY)
        )
        // Right vertical line
        path.addLine(to: CGPoint(x: rect.maxX - topCornerRadius, y: topCornerRadius))
        // Top right curve
        path.addQuadCurve(
            to: CGPoint(x: rect.maxX, y: rect.minY),
            control: CGPoint(x: rect.maxX - topCornerRadius, y: rect.minY)
        )
        
        path.closeSubpath()
        return path
    }
}
