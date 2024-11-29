//
//  WindowManagerService.swift
//  GoodNotch
//
//  Created by Denis Ronchese on 13/11/24.
//

import Foundation
import Combine

protocol WindowManagerService {
    var windowState: AnyPublisher<NotchState, Never> { get }
    func configureWindow(_ configuration: NotchConfiguration)
    func updateWindowState(_ state: NotchState)
}
