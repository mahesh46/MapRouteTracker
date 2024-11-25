//
//  ContentView.swift
//  mapRoutesApp
//
//  Created by mahesh lad on 17/11/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var locationManager = LocationManager()
    @StateObject private var routeStore = RouteStore()
    @State private var showingSaveSheet = false
    
    var body: some View {
        NavigationStack {
            VStack {
                MapView(locations: locationManager.locations)
                    .edgesIgnoringSafeArea(.top)
                    .frame(height: 500)
                
                VStack(spacing: 20) {
                    Button(action: {
                        if locationManager.isTracking {
                            locationManager.stopTracking()
                            showingSaveSheet = true
                        } else {
                            locationManager.startTracking()
                        }
                    }) {
                        Text(locationManager.isTracking ? "Stop Tracking" : "Start Tracking")
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 200.0, height: 50.0)
                            .background(locationManager.isTracking ? Color.red : Color.green)
                            .cornerRadius(10)
                    }
                    
                    NavigationLink(destination: RouteListView(routeStore: routeStore)) {
                        Text("View Saved Routes")
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 200.0, height: 50.0)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                }
                .padding()
                
                Spacer()
            }
            .navigationTitle("Route Tracker")
            .sheet(isPresented: $showingSaveSheet) {
                SaveRouteSheet(
                    routeStore: routeStore,
                    locations: locationManager.locations
                )
            }
            .task {
                locationManager.requestPermission()
               // locationManager.startTracking()
            }
        }
    }
}


#Preview {
    ContentView()
}
