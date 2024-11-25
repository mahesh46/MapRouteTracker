//
//  SaveRouteSheet.swift
//  mapRoutesApp
//
//  Created by mahesh lad on 17/11/2024.
//
import SwiftUI

struct SaveRouteSheet: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var routeStore: RouteStore
    let locations: [LocationData]
    @State private var routeName = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Route Name", text: $routeName)
                Button("Save Route") {
                    routeStore.saveRoute(name: routeName, locations: locations)
                    dismiss()
                }
                .disabled(routeName.isEmpty)
            }
            .navigationTitle("Save Route")
            .navigationBarItems(trailing: Button("Cancel") { dismiss() })
        }
    }
}
