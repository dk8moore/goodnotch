//
//  NotchWindow.swift
//  GoodNotch
//
//  Created by Denis Ronchese on 13/11/24.
//

import AppKit
import SwiftUI

class NotchWindow: NSPanel {
    private let configuration: NotchConfiguration
    
    init(configuration: NotchConfiguration = .default) {
        self.configuration = configuration
        
        let screenRect = NSScreen.main?.frame ?? .zero
        let windowRect = CGRect(
            x: (screenRect.width - configuration.openSize.width) / 2,
            y: screenRect.maxY - configuration.openSize.height,
            width: configuration.openSize.width,
            height: configuration.openSize.height
        )
        
        super.init(
            contentRect: windowRect,
            styleMask: [.borderless, .nonactivatingPanel, .utilityWindow, .hudWindow],
            backing: .buffered,
            defer: false
        )
        
        self.contentView = NSHostingView(rootView: NotchContentView())
        
        configureWindow()
    }
    
    private func configureWindow() {
        isFloatingPanel = true
        isOpaque = false
        titleVisibility = .hidden
        titlebarAppearsTransparent = true
        backgroundColor = .clear
        isMovable = false
        hasShadow = false
        
        collectionBehavior = [
            .fullScreenAuxiliary,
            .stationary,
            .canJoinAllSpaces,
            .ignoresCycle
        ]
        
        level = .mainMenu + 3
        isReleasedWhenClosed = false
        
        if let screen = NSScreen.main {
            setFrameTopLeftPoint(NSPoint(
                x: frame.origin.x,
                y: screen.frame.maxY
            ))
        }
    }
    
    override var canBecomeKey: Bool { false }
    override var canBecomeMain: Bool { false }
}
