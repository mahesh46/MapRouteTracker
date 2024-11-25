//
//  Route.swift
//  mapRoutesApp
//
//  Created by mahesh lad on 17/11/2024.
//
import SwiftUI

struct Route: Codable, Identifiable, Equatable {
    let id: UUID
    let name: String
    let date: Date
    let locations: [LocationData]
    
    static func == (lhs: Route, rhs: Route) -> Bool {
        lhs.id == rhs.id &&
        lhs.name == rhs.name &&
        lhs.date == rhs.date &&
        lhs.locations == rhs.locations
    }
}
