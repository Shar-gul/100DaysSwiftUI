//
//  Activities.swift
//  HabitTracking
//
//  Created by Tiago Valente on 02/05/2023.
//

import Foundation

class Activities: ObservableObject {
    @Published var items = [ActivityItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Activities")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Activities") {
            if let decodedItems = try? JSONDecoder().decode([ActivityItem].self, from: savedItems) {
                items = decodedItems
                
                return
            }
        }
        
        items = []
    }
    
    func addActivity(_ activity: ActivityItem) {
        items.append(activity)
    }
    
    func updateActivity(_ activity: ActivityItem) {
        guard let index = getIndexOf(activity) else { return }
        
        items[index] = activity
    }
    
    func getActivityByID(_ id: UUID) -> ActivityItem {
        guard let index = getIndexBy(id) else { return ActivityItem(name: "",
                                                                    description: "",
                                                                    timesCompleted: 0)}
        
        return items[index]
    }
    
    private func getIndexOf(_ activity: ActivityItem) -> Int? {
        items.firstIndex { $0.id == activity.id }
    }
    
    private func getIndexBy(_ id: UUID) -> Int? {
        items.firstIndex { $0.id == id }
    }
}
