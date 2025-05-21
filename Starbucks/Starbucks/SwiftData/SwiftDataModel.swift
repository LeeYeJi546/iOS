//
//  SwiftDataModel.swift
//  4st_assignment
//
//  Created by 이예지 on 5/14/25.
//

import Foundation
import SwiftData
import UIKit

@Model
class Receipt {
    @Attribute(.unique) var id: UUID
    var count: Int
    var store: String
    var date: String
    var price: Int
    var createdAt: Date
    
    init(count: Int, store: String, date: String, price: Int, createdAt: Date = Date()) {
        self.id = UUID()
        self.count = count
        self.store = store
        self.date = date
        self.price = price
        self.createdAt = createdAt
    }
}
