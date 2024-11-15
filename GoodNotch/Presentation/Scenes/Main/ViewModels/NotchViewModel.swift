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
    private var currentDirectionIndex = 0
    private let directions: [NotchOpenDirection] = [
        .bottom, .left, .right, .leftBottom, .rightBottom, .all
    ]
    
    func toggleState() {
        if case .closed = state.notchState {
            open()
        } else {
            close()
        }
    }
    
    func open() {
        // TODO: animate this transition
        let direction = directions[currentDirectionIndex]
        state.notchState = .open(direction)
        
        // Get the expansion for the current direction
        guard let screen = NSScreen.main else { return }
        let expansion = NotchExpansion.calculate(
            for: direction,
            baseConfig: NotchConfiguration.default,
            screenFrame: screen.frame
        )
        
        state.size = expansion.size
        
        // Cycle through directions
        currentDirectionIndex = (currentDirectionIndex + 1) % directions.count
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
