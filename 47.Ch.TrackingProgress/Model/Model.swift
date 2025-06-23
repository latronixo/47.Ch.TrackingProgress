//
//  Model.swift
//  47.Ch.TrackingProgress
//
//  Created by Валентин on 23.06.2025.
//

import Foundation

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
