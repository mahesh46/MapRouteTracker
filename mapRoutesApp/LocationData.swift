//
//  LocationData.swift
//  mapRoutesApp
//
//  Created by mahesh lad on 17/11/2024.
//
import SwiftUI

struct LocationData: Codable, Identifiable, Equatable {
    let id: UUID
    let timestamp: Date
    let latitude: Double
    let longitude: Double
    
    static func == (lhs: LocationData, rhs: LocationData) -> Bool {
        lhs.id == rhs.id &&
        lhs.timestamp == rhs.timestamp &&
        lhs.latitude == rhs.latitude &&
        lhs.longitude == rhs.longitude
    }
}
