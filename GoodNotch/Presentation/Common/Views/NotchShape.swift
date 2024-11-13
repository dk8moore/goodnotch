//
//  NotchShape.swift
//  GoodNotch
//
//  Created by Denis Ronchese on 13/11/24.
//

import SwiftUI

struct NotchShape: Shape {
    let cornerRadius: CGFloat
    private var topCornerRadius: CGFloat
    
    init(cornerRadius: CGFloat = 10) {
        self.cornerRadius = cornerRadius
        self.topCornerRadius = cornerRadius > 15 ? cornerRadius - 5 : 5
    }
    
    var animatableData: CGFloat {
        get { cornerRadius }
        set { _ = newValue }
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
        
        // Left side
        path.addLine(to: CGPoint(x: rect.minX + topCornerRadius, y: rect.maxY - cornerRadius))
        
        // Bottom left corner
        path.addQuadCurve(
            to: CGPoint(x: rect.minX + topCornerRadius + cornerRadius, y: rect.maxY),
            control: CGPoint(x: rect.minX + topCornerRadius, y: rect.maxY)
        )
        
        // Bottom edge
        path.addLine(to: CGPoint(x: rect.maxX - topCornerRadius - cornerRadius, y: rect.maxY))
        
        // Bottom right corner
        path.addQuadCurve(
            to: CGPoint(x: rect.maxX - topCornerRadius, y: rect.maxY - cornerRadius),
            control: CGPoint(x: rect.maxX - topCornerRadius, y: rect.maxY)
        )
        
        // Right side
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
