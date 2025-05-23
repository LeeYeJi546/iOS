//
//  GeoJsonStoreViewModel.swift
//  Starbucks
//
//  Created by 이예지 on 5/22/25.
//

import Foundation
import SwiftUI
import MapKit
import Observation

@Observable
class GeoJsonStoreViewModel {
    var storelist: GeoJsonModel?
    
    func loadstorelist(completion: @escaping (Result<GeoJsonModel, Error>) -> Void) {
        guard let url = Bundle.main.url(forResource: "스타벅스_2025 데이터", withExtension: "geojson") else {
            print("geojson 파일 없음")
            completion(.failure(NSError(domain: "파일 못찾아요!", code: 404, userInfo: nil)))
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoded = try JSONDecoder().decode(GeoJsonModel.self, from: data)
            self.storelist = decoded
            print("디코딩 성공")
            completion(.success(decoded))
        } catch {
            print("디코딩 실패: \(error.localizedDescription)")
            completion(.failure(error))
        }
    }
}

@Observable
final class MapViewModel {
    
    var cameraPosition: MapCameraPosition = .userLocation(fallback: .automatic)
}
