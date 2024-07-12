//
//  iExpenseApp.swift
//  iExpense
//
//  Created by Tiago Valente on 11/04/2023.
//

import SwiftData
import SwiftUI

@main
struct iExpenseApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Expense.self)
    }
}
