//
//  GeoJsonModel.swift
//  Starbucks
//
//  Created by 이예지 on 5/22/25.
//

import Foundation

struct GeoJsonModel: Codable {
    let Sotre_nm: String
    let Address: String
    let Telephone: String
    let Category: String
    let Ycoordinate: Int
    let Xcoordinate: Int
    let coordinates: [Double]
    let image: String
}
