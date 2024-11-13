//
//  NotchViewModel.swift
//  GoodNotch
//
//  Created by Denis Ronchese on 13/11/24.
//

import SwiftUI
import Combine

final class NotchViewModel: ObservableObject {
    struct State {
        var notchState: NotchState = .closed
        var currentView: NotchView = .home
        var cornerRadius: CGFloat = NotchConfiguration.default.cornerRadius
        var size: NotchConfiguration.Size = NotchConfiguration.default.closedSize
        var appearance: NotchAppearance = .default
    }
    
    @Published private(set) var state: State = State()
    private var cancellables = Set<AnyCancellable>()
    
    func open() {
        withAnimation(.spring()) {
            state.notchState = .open
            state.size = NotchConfiguration.default.openSize
        }
    }
    
    func close() {
        withAnimation(.spring()) {
            state.notchState = .closed
            state.size = NotchConfiguration.default.closedSize
        }
    }
    
    func setView(_ view: NotchView) {
            withAnimation(.spring()) {
                state.currentView = view
            }
        }
        
    func updateAppearance(_ appearance: NotchAppearance) {
        withAnimation(.easeInOut) {
            state.appearance = appearance
        }
    }
}
