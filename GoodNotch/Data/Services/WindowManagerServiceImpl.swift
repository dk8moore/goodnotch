//
//  WindowManagerServiceImpl.swift
//  GoodNotch
//
//  Created by Denis Ronchese on 13/11/24.
//

import Foundation
import Combine
import AppKit

final class WindowManagerServiceImpl: WindowManagerService {
    private var window: NotchWindow?
    private let windowStateSubject = CurrentValueSubject<NotchState, Never>(.closed)
    
    var windowState: AnyPublisher<NotchState, Never> {
        windowStateSubject.eraseToAnyPublisher()
    }
    
    func configureWindow(_ configuration: NotchConfiguration) {
        let newWindow = NotchWindow(configuration: configuration)
        self.window = newWindow
        newWindow.makeKeyAndOrderFront(nil)
    }
    
    func updateWindowState(_ state: NotchState) {
        windowStateSubject.send(state)
        guard let window = window else { return }
        
        switch state {
        case .closed:
            updateWindowSize(NotchConfiguration.default.closedSize)
        case .open(let direction):
            guard let screen = NSScreen.main else { return }
            let expansion = NotchExpansion.calculate(
                for: direction,
                baseConfig: NotchConfiguration.default,
                screenFrame: screen.frame
            )
            window.setFrame(
                CGRect(origin: expansion.origin, size: CGSize(width: expansion.size.width, height: expansion.size.height)),
                display: true,
                animate: true
            )
        }
    }
    
    func updateWindowSize(_ size: NotchConfiguration.Size) {
        guard let window = window else { return }
        let frame = window.frame
        let newFrame = CGRect(
            x: frame.origin.x,
            y: frame.origin.y,
            width: size.width,
            height: size.height
        )
        window.setFrame(newFrame, display: true, animate: true)
    }
}
