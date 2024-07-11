//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Tiago Valente on 04/07/2024.
//

import SwiftData
import SwiftUI

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
        // Lesson 3
        //.modelContainer(for: Student.self)
    }
}
