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
                switch viewModel.state.notchState {
                case .closed:
                    Text("Notch closed")
                        .foregroundColor(viewModel.state.appearance.foregroundColor)
                case .open(let direction):
                    Text("Direction: \(String(describing: direction))")
                        .foregroundColor(viewModel.state.appearance.foregroundColor)
                }
            }
        }
        .frame(
            width: viewModel.state.size.width,
            height: viewModel.state.size.height
        )
        .onTapGesture {
            viewModel.toggleState()
        }
    }
}

#Preview {
    NotchContentView()
        .frame(width: NotchConfiguration.default.closedSize.width, height: NotchConfiguration.default.closedSize.height)
}
