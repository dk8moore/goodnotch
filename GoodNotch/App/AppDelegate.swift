//
//  AppDelegate.swift
//  GoodNotch
//
//  Created by Denis Ronchese on 13/11/24.
//

import AppKit
import SwiftUI

class AppDelegate: NSObject, NSApplicationDelegate {
    private var windowManager: WindowManagerService!
    private var notchSpace: NotchSpaceService!
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        // Hide dock icon and main menu bar
        NSApp.setActivationPolicy(.accessory)
        
        // Initialize services
        self.windowManager = Container.shared.resolve() as WindowManagerService
        self.notchSpace = Container.shared.resolve() as NotchSpaceService
        
        // Configure and show window
        self.windowManager.configureWindow(NotchConfiguration.default)
    }
    
    func applicationDidBecomeActive(_ notification: Notification) {
        NSApp.setActivationPolicy(.accessory)
    }
}
