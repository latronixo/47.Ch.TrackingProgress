//
//  ActivityDetail.swift
//  47.Ch.TrackingProgress
//
//  Created by Валентин on 23.06.2025.
//

import SwiftUI

struct DetailView: View {
    @State var name = ""
    @State var description = ""
    @State var count = 0
    
    @Binding var activities: Activities
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack{
            Form {
                Text(name)
                Text(description)
                Picker("Количество:", selection: $count) {
                    ForEach(0..<100, id: \.self) {
                        Text("\($0)")
                    }
                }
                .pickerStyle(.wheel)
            }
        }
        .navigationTitle("Об активности")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Сохранить") {
                    let activity = ActivityItem(name: name, description: description, count: count)
                    if let index = activities.items.firstIndex(where: {$0.name == activity.name }) {
                        activities.items[index] = activity
                        print("сохранено")
                    } else {
                        print("не сохранено")
                    }
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    struct PreviewWrapper: View {
        @State private var activities = Activities()
        
        var body: some View {
            DetailView(
                activities: $activities
            )
        }
    }
    
    return PreviewWrapper()
}
