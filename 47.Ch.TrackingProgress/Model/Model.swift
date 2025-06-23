//
//  Model.swift
//  47.Ch.TrackingProgress
//
//  Created by Валентин on 23.06.2025.
//

import Foundation

struct ActivityItem: Equatable, Identifiable, Codable {
    var id = UUID()
    var name: String
    var description: String
    var count: Int
}

@Observable
class Activities: Identifiable {
    var items = [ActivityItem]() {
        didSet {
            saveItems()
        }
    }
    
    init() {
        loadItems()
    }
    
    private func loadItems() {
        if let savedItems = UserDefaults.standard.data(forKey: "Activities"),
            let decodedItems = try? JSONDecoder().decode([ActivityItem].self, from: savedItems) {
            items = decodedItems
        }
    }
    
    private func saveItems() {
        if let encodedItems = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedItems, forKey: "Activities")
        }
    }
}
