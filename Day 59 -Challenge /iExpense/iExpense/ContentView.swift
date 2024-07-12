//
//  ContentView.swift
//  iExpense
//
//  Created by Tiago Valente on 11/04/2023.
//

import SwiftData
import SwiftUI

enum FilterType {
    case all
    case business
    case personal
}

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    
    @State private var sortOrder = [
        SortDescriptor(\Expense.name),
        SortDescriptor(\Expense.amount),
    ]
    @State private var filterType: FilterType = .all
    
    @State private var showingAddExpense = false

    var body: some View {
        NavigationStack {
            ExpensesView(sortOrder: sortOrder, 
                         filter: filterType)
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
                Menu("Sort", systemImage: "arrow.up.arrow.down") {
                    Picker("Sort", selection: $sortOrder) {
                        Text("Sort by Name")
                            .tag([
                                SortDescriptor(\Expense.name),
                                SortDescriptor(\Expense.amount),
                            ])
                        
                        Text("Sort by Amount")
                            .tag([
                                SortDescriptor(\Expense.amount),
                                SortDescriptor(\Expense.name)
                            ])
                    }
                }
                Menu("Filter", systemImage: "scissors") {
                    Picker("Filter by Type", selection: $filterType) {
                        Text("All")
                            .tag(FilterType.all)
                        
                        Text("Business")
                            .tag(FilterType.business)
                        
                        Text("Personal")
                            .tag(FilterType.personal)
                    }
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
