//
//  NotchBackground.swift
//  GoodNotch
//
//  Created by Denis Ronchese on 13/11/24.
//

import SwiftUI

struct Notch: View {
    let backgroundColor: Color
    let opacity: Double
    let cornerRadius: CGFloat
    
    var body: some View {
        NotchShape(cornerRadius: cornerRadius)
            .fill(backgroundColor)
            .opacity(opacity)
    }
}

#Preview {
    Notch(backgroundColor: NotchConfiguration.default.appearance.backgroundColor, opacity: NotchConfiguration.default.appearance.opacity, cornerRadius: NotchConfiguration.default.cornerRadius)
        .frame(width: NotchConfiguration.default.closedSize.width, height: NotchConfiguration.default.closedSize.height)
}
