//
//  Container.swift
//  GoodNotch
//
//  Created by Denis Ronchese on 13/11/24.
//

import Foundation

final class Container {
    static let shared = Container()
    private var services: [String: Any] = [:]
    
    private init() {}
    
    func register<T>(_ type: T.Type, factory: @escaping () -> T) {
        let key = String(describing: type)
        print("Registering service: \(key)")  // Debug log
        services[key] = factory
    }
    
    func resolve<T>() -> T {
        let key = String(describing: T.self)
        print("Resolving service: \(key)")  // Debug log
        
        guard let factory = services[key] as? () -> T else {
            fatalError("No registration for type \(key)")
        }
        return factory()
    }
}
