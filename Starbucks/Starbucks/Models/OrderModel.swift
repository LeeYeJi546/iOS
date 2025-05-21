//
//  ShopModel.swift
//  4th_assignment
//
//  Created by 이예지 on 4/10/25.
//

import Foundation
import SwiftUI

struct OdModel: Identifiable, ImageDisplayable2 {
    let id = UUID()
    let imageName: String
    let korText: String
    let engText: String
}

protocol ImageDisplayable2 {
    var imageName: String { get }
    var korText: String { get }
    var engText: String { get }
}

