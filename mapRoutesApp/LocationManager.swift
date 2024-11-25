//
//  LocationManager.swift
//  mapRoutesApp
//
//  Created by mahesh lad on 17/11/2024.
//
import SwiftUI
import MapKit
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private let locationManager = CLLocationManager()
    @Published var locations: [LocationData] = []
    @Published var isTracking = false
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.allowsBackgroundLocationUpdates = true
        locationManager.pausesLocationUpdatesAutomatically = false
    }
    
    func startTracking() {
        locations.removeAll()
        locationManager.startUpdatingLocation()
        isTracking = true
    }
    
    func stopTracking() {
        locationManager.stopUpdatingLocation()
        isTracking = false
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let locationData = LocationData(
            id: UUID(),
            timestamp: Date(),
            latitude: location.coordinate.latitude,
            longitude: location.coordinate.longitude
        )
        self.locations.append(locationData)
    }
    
    func requestPermission() {
        locationManager.requestWhenInUseAuthorization()
    }
}
