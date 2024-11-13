//
//  NotchSpaceService.swift
//  GoodNotch
//
//  Created by Denis Ronchese on 13/11/24.
//

import Foundation
import Combine

protocol NotchSpaceService {
    var spaceState: AnyPublisher<Bool, Never> { get }
    func activateSpace()
    func deactivateSpace()
}
