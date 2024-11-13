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
        services[String(describing: type)] = factory
    }
    
    func resolve<T>() -> T {
        guard let factory = services[String(describing: T.self)] as? () -> T else {
            fatalError("No registration for type \(T.self)")
        }
        return factory()
    }
}
