//
//  ContentView.swift
//  47.Ch.TrackingProgress
//
//  Created by Валентин on 23.06.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var activities = Activities()
    @State private var showingAddActivity = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(activities.items) { activity in
                    HStack {
                        NavigationLink {
                            DetailView(name: activity.name, description: activity.description, count: activity.count, activities: $activities)
                        } label: {
                            Text(activity.name)
                                .font(.headline)
                        }
                        Spacer()
                        Text("Количество: \(activity.count)")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .navigationTitle("Активности")
            .toolbar {
                Button("Добавить активность", systemImage: "plus") {
                    showingAddActivity.toggle()
                }
                .sheet(isPresented: $showingAddActivity) {
                    AddView(activities: activities)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
