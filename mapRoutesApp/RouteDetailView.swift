//
//  RouteDetailView.swift
//  mapRoutesApp
//
//  Created by mahesh lad on 17/11/2024.
//
import SwiftUI
import CoreLocation

struct RouteDetailView: View {
    let route: Route
    
    private func calculateTotalDistance(locations: [LocationData]) -> Double {
        guard locations.count > 1 else { return 0.0 }
        var totalDistance: Double = 0.0
        for i in 1..<locations.count {
            let start = CLLocation(latitude: locations[i-1].latitude, longitude: locations[i-1].longitude)
            let end = CLLocation(latitude: locations[i].latitude, longitude: locations[i].longitude)
            totalDistance += start.distance(from: end) }
        return totalDistance }
    
    private func formatDistance(_ distance: Double) -> String {
        let distanceInKm = distance / 1000
        return String(format: "%.2f", distanceInKm) }
    
    private func formatDuration(_ duration: TimeInterval) -> String {
            let hours = Int(duration) / 3600
            let minutes = (Int(duration) % 3600) / 60
            let seconds = Int(duration) % 60
            return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
    var body: some View {
        VStack {
            MapView(locations: route.locations)
            
            List {
                Section(header: Text("Route Details")) {
                    Text("Name: \(route.name)")
                    Text("Date: \(route.date, style: .date)")
                    Text("Points: \(route.locations.count)")
                    if let duration = route.locations.last?.timestamp.timeIntervalSince(route.locations.first?.timestamp ?? Date()) {
                        Text("Duration: \(formatDuration(duration))")
                    }
                    Text("Distance: \(formatDistance(calculateTotalDistance(locations: route.locations))) km")
                }
            }
        }
        .navigationTitle(route.name)
    }
    
    
}
    


    
    
