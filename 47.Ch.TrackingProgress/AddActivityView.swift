//
//  AddActivity.swift
//  47.Ch.TrackingProgress
//
//  Created by Валентин on 23.06.2025.
//

import SwiftUI

struct AddActivityView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var count = 0
    
    var activities: Activities
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Активность", text: $name)
                    .textFieldStyle(.roundedBorder)
                Picker("Количество", selection: $count) {
                    ForEach(0..<100, id: \.self) {
                        Text("\($0)")
                    }
                }
                .pickerStyle(.wheel)
            }
            .navigationTitle("Новый вид деятельности")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Сохранить") {
                        let activity = ActivityItem(name: name, count: count)
                        activities.items.append(activity)
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    AddActivityView(activities: Activities())
}
