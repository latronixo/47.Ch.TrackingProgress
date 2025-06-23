//
//  ContentView.swift
//  47.Ch.TrackingProgress
//
//  Created by Валентин on 23.06.2025.
//

import SwiftUI

struct ActivityItem: Equatable, Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let count: Int
}

@Observable
class Activities: Identifiable {
    var id = UUID()
    var items: [ActivityItem]
    
    init() {
        items = []
        loadItems()
    }
    
    private func loadItems() {
        items = [
            ActivityItem(name: "DaysSwifUIHudson", description: "учеба", count: 47),
            ActivityItem(name: "Подтягивания", description: "спорт", count: 5),
            ActivityItem(name: "Соло на клавиатуре", description: "совершенствуюсь", count: 3),
        ]
    }
}

struct ContentView: View {
    @State private var activities = Activities()
    @State private var showingAddActivity = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(activities.items) { activity in
                    HStack {
                        NavigationLink {
                            ActivityDetail(name: activity.name, description: activity.description, count: activity.count, activities: activities)
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
                    AddActivityView(activities: activities)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
