//
//  ActivityItem.swift
//  HabitTracking
//
//  Created by Tiago Valente on 02/05/2023.
//

import Foundation

struct ActivityItem: Identifiable, Codable, Equatable {
    var id = UUID()
    var name: String
    var description: String
    var timesCompleted: Int
}
