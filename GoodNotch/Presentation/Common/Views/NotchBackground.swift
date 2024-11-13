//
//  NotchBackground.swift
//  GoodNotch
//
//  Created by Denis Ronchese on 13/11/24.
//

import SwiftUI

struct NotchBackground: View {
    let appearance: NotchAppearance
    let cornerRadius: CGFloat
    
    var body: some View {
        NotchShape(cornerRadius: cornerRadius)
            .fill(appearance.backgroundColor)
            .opacity(appearance.opacity)
    }
}
