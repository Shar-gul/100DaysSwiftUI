//
//  ContentView.swift
//  iExpense
//
//  Created by Tiago Valente on 11/04/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            List {
//                ForEach(expenses.items) { item in
//                    HStack {
//                        VStack(alignment: .leading) {
//                            Text(item.name)
//                                .font(.headline)
//                            Text(item.type)
//                        }
//
//                        Spacer()
//
//                        Text(item.amount,
//                             format: .currency(code: Locale.current.currencyCode ?? "USD"))
//                            .expenseStyle(for: item)
//                    }
//                }
//                .onDelete(perform: removeItems)
                ExpenseSection(title: "Business",
                               expenses: expenses.businessItems,
                               deleteItems: removeBusinessItems)
                
                ExpenseSection(title: "Personal",
                               expenses: expenses.personalItems,
                               deleteItems: removePersonalItems)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
    func removeItems(at offsets: IndexSet,
                     in inputArray: [ExpenseItem]) {
        var objectsToDelete = IndexSet()
        
        for offset in offsets {
            let item = inputArray[offset]
            if let index = expenses.items.firstIndex(of: item) {
                objectsToDelete.insert(index)
            }
        }
        
        expenses.items.remove(atOffsets: objectsToDelete)
    }
    
    func removePersonalItems(at offsets: IndexSet) {
        removeItems(at: offsets,
                    in: expenses.personalItems)
    }
    
    func removeBusinessItems(at offsets: IndexSet) {
        removeItems(at: offsets,
                    in: expenses.businessItems)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
