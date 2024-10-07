//
//  HotProspectsApp.swift
//  HotProspects
//
//  Created by Tiago Valente on 30/09/2024.
//

import SwiftData
import SwiftUI

@main
struct HotProspectsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
//            Lesson1View()
//            Lesson2View()
//            Lesson3View()
//            Lesson4View()
//            Lesson5View()
//            Lesson6View()
//            Lesson7View()
//            Lesson8View()
        }
        .modelContainer(for: Prospect.self)
    }
}
