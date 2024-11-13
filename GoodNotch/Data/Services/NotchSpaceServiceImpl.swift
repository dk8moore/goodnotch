//
//  NotchSpaceServiceImpl.swift
//  GoodNotch
//
//  Created by Denis Ronchese on 13/11/24.
//

import Foundation
import Combine

final class NotchSpaceServiceImpl: NotchSpaceService {
    private let space: CGSSpace
    private let spaceStateSubject = CurrentValueSubject<Bool, Never>(false)
    
    var spaceState: AnyPublisher<Bool, Never> {
        spaceStateSubject.eraseToAnyPublisher()
    }
    
    init() {
        self.space = CGSSpace(level: Int.max)
        setupSpaceMonitoring()
    }
    
    private func setupSpaceMonitoring() {
        // Implement space monitoring logic
    }
    
    func activateSpace() {
        space.activate()
        spaceStateSubject.send(true)
    }
    
    func deactivateSpace() {
        spaceStateSubject.send(false)
    }
}
