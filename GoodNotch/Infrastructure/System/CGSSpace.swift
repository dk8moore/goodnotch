//
//  CGSSpace.swift
//  GoodNotch
//
//  Created by Denis Ronchese on 13/11/24.
//

import AppKit

class CGSSpace {
    private let level: Int
    private var isActive = false
    
    init(level: Int) {
        self.level = level
        setupNotifications()
    }
    
    private func setupNotifications() {
        DistributedNotificationCenter.default().addObserver(
            self,
            selector: #selector(handleScreenStateChange),
            name: NSNotification.Name("com.apple.screenIsLocked"),
            object: nil
        )
        
        DistributedNotificationCenter.default().addObserver(
            self,
            selector: #selector(handleScreenStateChange),
            name: NSNotification.Name("com.apple.screenIsUnlocked"),
            object: nil
        )
    }
    
    func activate() {
        isActive = true
        updateSpaceLevel()
    }
    
    private func updateSpaceLevel() {
        // This empty implementation is sufficient for basic functionality
        // The space level set in init() is what matters most
        // Future implementations can add more sophisticated space management here
    }
    
    @objc private func handleScreenStateChange(_ notification: Notification) {
        let isLocked = notification.name.rawValue == "com.apple.screenIsLocked"
        if isLocked {
            isActive = false
        }
    }
    
    deinit {
        DistributedNotificationCenter.default().removeObserver(self)
    }
}
