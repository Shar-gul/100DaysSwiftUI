//
//  ExpensesView.swift
//  iExpense
//
//  Created by Tiago Valente on 12/07/2024.
//

import SwiftData
import SwiftUI

struct ExpensesView: View {
    @Environment(\.modelContext) var modelContext
    @Query var expenses: [Expense]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses, id: \.self) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }

                        Spacer()

                        Text(item.amount,
                             format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                            .expenseStyle(for: item)
                    }
                }
                .onDelete(perform: removeItems)
            }
        }
    }
    
    init(sortOrder: [SortDescriptor<Expense>]) {
//        _expenses = Query(filter: #Predicate<Expense> { item in
//            item.type == "Business" || item.type == "Personal"
//        }, sort: sortOrder)
        _expenses = Query(sort: sortOrder)
    }
    
    private func removeItems(at offsets: IndexSet) {
        for offset in offsets {
            let expense = expenses[offset]
            
            modelContext.delete(expense)
        }
    }
}

#Preview {
    ExpensesView(sortOrder: [SortDescriptor(\Expense.name)])
        .modelContainer(for: Expense.self)
}
