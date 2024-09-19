//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Tiago Valente on 14/04/2023.
//

import Foundation

struct ExpenseItem: Identifiable, Codable, Equatable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
