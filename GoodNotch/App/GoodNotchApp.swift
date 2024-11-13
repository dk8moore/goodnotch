//
//  GoodNotchApp.swift
//  GoodNotch
//
//  Created by Denis Ronchese on 13/11/24.
//

import SwiftUI

@main
struct NotchApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            NotchContentView()
        }
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    var window: NotchWindow?
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        window = NotchWindow(configuration: .default)
        window?.contentView = NSHostingView(rootView: NotchContentView())
        window?.makeKeyAndOrderFront(nil)
    }
}
