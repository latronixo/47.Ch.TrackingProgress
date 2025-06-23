//
//  ContentView.swift
//  47.Ch.TrackingProgress
//
//  Created by Валентин on 23.06.2025.
//

import SwiftUI

struct TypeActivity: Identifiable {
    let id = UUID()
    let name: String
    let count: Int
}

@Observable
class Activities: Identifiable {
    var id = UUID()
    var type: [TypeActivity]
    
    init(type: [TypeActivity]) {
        self.type = type
    }
}

struct ContentView: View {
    @State private var activities = Activities (type: [
        TypeActivity(name: "DaysSwifUIHudson", count: 47),
        TypeActivity(name: "Подтягивания", count: 5),
        TypeActivity(name: "Соло на клавиатуре", count: 3),
    ])
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(activities.type) { activity in
                    HStack {
                        Text(activity.name)
                            .font(.headline)
                        Spacer()
                        Text("Количество: \(activity.count)")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .navigationTitle("Activities")
        }
    }
}

#Preview {
    ContentView()
}
