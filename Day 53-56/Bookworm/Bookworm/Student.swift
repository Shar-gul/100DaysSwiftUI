//
//  Student.swift
//  Bookworm
//
//  Created by Tiago Valente on 07/07/2024.
//

// Lesson 3

import Foundation
import SwiftData

@Model
class Student {
    var id: UUID
    var name: String
    
    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
}
