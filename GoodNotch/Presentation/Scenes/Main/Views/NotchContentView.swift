//
//  NotchContentView.swift
//  GoodNotch
//
//  Created by Denis Ronchese on 13/11/24.
//

import SwiftUI

struct NotchContentView: View {
    @StateObject private var viewModel = NotchViewModel()
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            Notch(
                backgroundColor: viewModel.state.appearance.backgroundColor,
                opacity: viewModel.state.appearance.opacity,
                cornerRadius: viewModel.state.cornerRadius
            )
            
            VStack {
                if viewModel.state.notchState == .open {
                    Text("Open State")
                        .foregroundColor(viewModel.state.appearance.foregroundColor)
                } else {
                    Text("Closed State")
                        .foregroundColor(viewModel.state.appearance.foregroundColor)
                }
            }
        }
        .frame(
            width: viewModel.state.size.width,
            height: viewModel.state.size.height
        )
        .onTapGesture {
            if viewModel.state.notchState == .closed {
                viewModel.open()
            } else {
                viewModel.close()
            }
        }
    }
}

#Preview {
    NotchContentView()
        .frame(width: NotchConfiguration.default.closedSize.width, height: NotchConfiguration.default.closedSize.height)
            .padding()
}
