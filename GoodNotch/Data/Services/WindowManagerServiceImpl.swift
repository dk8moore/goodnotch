//
//  WindowManagerServiceImpl.swift
//  GoodNotch
//
//  Created by Denis Ronchese on 13/11/24.
//

import Foundation
import Combine

final class WindowManagerServiceImpl: WindowManagerService {
    private weak var window: NotchWindow?
    private let windowStateSubject = CurrentValueSubject<NotchState, Never>(.closed)
    
    var windowState: AnyPublisher<NotchState, Never> {
        windowStateSubject.eraseToAnyPublisher()
    }
    
    func configureWindow(_ configuration: NotchConfiguration) {
        window = NotchWindow(configuration: configuration)
        window?.makeKeyAndOrderFront(nil)
    }
    
    func updateWindowSize(_ size: NotchConfiguration.Size) {
        guard let window = window else { return }
        let frame = window.frame
        let newFrame = NSRect(
            x: frame.origin.x,
            y: frame.origin.y,
            width: size.width,
            height: size.height
        )
        window.setFrame(newFrame, display: true, animate: true)
    }
}
