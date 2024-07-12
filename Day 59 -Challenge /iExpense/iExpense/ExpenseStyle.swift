//
//  ExpenseStyle.swift
//  iExpense
//
//  Created by Tiago Valente on 17/04/2023.
//

import SwiftUI

struct ExpenseStyle: ViewModifier {
    let expense: Expense
    
    func body(content: Content) -> some View {
        switch expense.amount {
        case 0..<10:
            content
                .font(.body)
                .foregroundColor(.green)
        case 10..<100:
            content
                .font(.body)
                .foregroundColor(.orange)
        default:
            content
                .font(.body)
                .foregroundColor(.red)
        }
    }
}

extension View {
    func expenseStyle(for expense: Expense) -> some View {
        modifier(ExpenseStyle(expense: expense))
    }
}
