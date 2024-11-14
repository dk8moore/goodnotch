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
        var appearance: NotchConfiguration.Appearance = NotchConfiguration.default.appearance
    }
    
    @Published private(set) var state: State = State()
    private var cancellables = Set<AnyCancellable>()
    
    func open() {
        // TODO: animate this transition
        state.notchState = .open
        state.size = NotchConfiguration.default.openSize
    }
    
    func close() {
        // TODO: animate this transition
        state.notchState = .closed
        state.size = NotchConfiguration.default.closedSize
    }
    
    func setView(_ view: NotchView) {
        // TODO: animate this transition
        state.currentView = view
    }
        
    func updateAppearance(_ appearance: NotchConfiguration.Appearance) {
        // TODO: animate this transition
        state.appearance = appearance
    }
}
