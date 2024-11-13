//
//  CoreAssemply.swift
//  GoodNotch
//
//  Created by Denis Ronchese on 13/11/24.
//

import Foundation

final class CoreAssembly {
    private let container: Container
    
    init(container: Container) {
        self.container = container
    }
    
    func register() {
        container.register(NotchSpaceService.self) {
            NotchSpaceServiceImpl()
        }
        
        container.register(WindowManagerService.self) {
            WindowManagerServiceImpl()
        }
    }
}
