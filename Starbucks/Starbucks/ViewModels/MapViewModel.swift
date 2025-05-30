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
class MapViewModel {
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
    
    var cameraPosition: MapCameraPosition = .userLocation(fallback: .automatic)
    var currentMapCenter: CLLocationCoordinate2D?
        
    // 마커
    var makers: [Marker] = [
            .init(coordinate: .init(latitude: 37.455175, longitude: 127.133486), title: "가천대학교 AI공학관"),
            .init(coordinate: .init(latitude: 37.519859, longitude: 127.127439), title: "KSPO DOME (올림픽체조경기장)")
    ]
    
    var region: MKCoordinateRegion = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 37.5665, longitude: 126.9780),
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )
}
