//
//  RouteStore.swift
//  mapRoutesApp
//
//  Created by mahesh lad on 17/11/2024.
//
import SwiftUI

class RouteStore: ObservableObject {
    @Published var routes: [Route] = []
    private let saveKey = "SavedRoutes"
    
    init() {
        loadRoutes()
    }
    
    func saveRoute(name: String, locations: [LocationData]) {
        let newRoute = Route(id: UUID(), name: name, date: Date(), locations: locations)
        routes.append(newRoute)
        saveRoutes()
    }
    
    func deleteRoute(at offsets: IndexSet) {
        routes.remove(atOffsets: offsets)
        saveRoutes()
    }
    
    private func saveRoutes() {
        if let encoded = try? JSONEncoder().encode(routes) {
            UserDefaults.standard.set(encoded, forKey: saveKey)
        }
    }
    
    private func loadRoutes() {
        if let data = UserDefaults.standard.data(forKey: saveKey),
           let decoded = try? JSONDecoder().decode([Route].self, from: data) {
            routes = decoded
        }
    }
    
   
}
