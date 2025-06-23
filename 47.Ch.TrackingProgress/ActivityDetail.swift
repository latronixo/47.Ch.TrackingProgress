//
//  ActivityDetail.swift
//  47.Ch.TrackingProgress
//
//  Created by Валентин on 23.06.2025.
//

import SwiftUI

struct ActivityDetail: View {
    @State var name: String
    @State var description: String
    @State var count: Int
    
    var activities: Activities
    
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
                    if let index = activities.items.firstIndex(of: activity) {
                        activities.items[index] = activity
                    }
                }
            }
        }
    }
}

#Preview {
    //let activity = ActivityItem(name: name, description: description, count: count)
    ActivityDetail(name: "S", description: "S", count: 5, activities: Activities())
}
