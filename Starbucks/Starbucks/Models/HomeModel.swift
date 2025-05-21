//
//  HomeModel.swift
//  3rd_assignment
//
//  Created by 이예지 on 4/4/25.
//

import Foundation
import SwiftUI

struct CoffeeModel: Identifiable, ImageDisplayable1 {
    let id = UUID()
    let imageName: String
    let titleText: String
}

protocol ImageDisplayable1 {
    var imageName: String { get }
    var titleText: String { get }
}


struct whatsnewModel: Identifiable {
    var id: UUID = UUID()
    var newTitle: String
    var newImage: String
    var newBody: String
}

struct DessertModel: Identifiable, ImageDisplayable1 {
    var id: UUID = UUID()
    var imageName: String
    var titleText: String
}

enum CoffeeTemperature: String, CaseIterable, Hashable {
    case hot = "HOT"
    case iced = "ICED"
    case hotOnly = "HOT ONLY"
    case icedOnly = "ICED ONLY"
}

struct Coffee: Identifiable, Hashable, ImageDisplayable1 {
    let id = UUID()
    let titleText: String
    let nameEng: String
    let description: String
    let price: Int
    let temperatureOptions: [CoffeeTemperature]
    let imageName: String
}
