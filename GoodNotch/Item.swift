//
//  Item.swift
//  GoodNotch
//
//  Created by Denis Ronchese on 13/11/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
