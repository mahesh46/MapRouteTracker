//
//  MapView.swift
//  mapRoutesApp
//
//  Created by mahesh lad on 17/11/2024.
//
import SwiftUI
import MapKit
import CoreLocation

struct MapView: View {
    let locations: [LocationData]
    @State private var region: MKCoordinateRegion
    
    init(locations: [LocationData]) {
        self.locations = locations
        let initialRegion = MKCoordinateRegion(
            center: locations.last.map { CLLocationCoordinate2D(latitude: $0.latitude, longitude: $0.longitude) }
                ?? CLLocationCoordinate2D(latitude: 0, longitude: 0),
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )
        _region = State(initialValue: initialRegion)
    }
    
    var body: some View {
        Map(coordinateRegion: $region, showsUserLocation: true, annotationItems: locations) { location in
            MapAnnotation(coordinate: CLLocationCoordinate2D(
                latitude: location.latitude,
                longitude: location.longitude
            )) {
                Circle()
                    .fill(.red)
                    .frame(width: 10, height: 10)
            }
        }
        .onChange(of: locations) { old, new_ in
            if let lastLocation = locations.last {
                region.center = CLLocationCoordinate2D(
                    latitude: lastLocation.latitude,
                    longitude: lastLocation.longitude
                )
            }
        }
       
    }
}

