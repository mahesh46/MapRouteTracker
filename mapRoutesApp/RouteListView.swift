//
//  RouteListView.swift
//  mapRoutesApp
//
//  Created by mahesh lad on 17/11/2024.
//
import SwiftUI

struct RouteListView: View {
    @ObservedObject var routeStore: RouteStore
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(routeStore.routes) { route in
                    NavigationLink(destination: RouteDetailView(route: route)) {
                        VStack(alignment: .leading) {
                            Text(route.name)
                                .font(.headline)
                            Text(route.date, style: .date)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        
                    }
                }
                .onDelete(perform: delete)
            }
            .navigationTitle("Saved Routes")
            
        }
        
        
    }
    private func delete(at offsets: IndexSet) {
        routeStore.deleteRoute(at: offsets) }
}
