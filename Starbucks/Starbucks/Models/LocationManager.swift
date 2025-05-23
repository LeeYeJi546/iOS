//
//  LocationManager.swift
//  Starbucks
//
//  Created by 이예지 on 5/22/25.
//

import Foundation
import CoreLocation
import MapKit
import Observation

@Observable
class LocationManager: NSObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        setupLocationManager()
    }
    
    private func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
    }
    
    func getCurrentLocation() {
        locationManager.startUpdatingLocation()
    }
    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        guard let currentLocation = locations.first else { return }
//        
//        let 
//        
//    }
}
