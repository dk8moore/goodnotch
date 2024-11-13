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
    
    init() {
        setupDependencies()
    }
    
    private func setupDependencies() {
        let container = Container.shared
        let coreAssembly = CoreAssembly(container: container)
        coreAssembly.register()
    }
    
    var body: some Scene {
        Settings {
            EmptyView()
        }
    }
}

