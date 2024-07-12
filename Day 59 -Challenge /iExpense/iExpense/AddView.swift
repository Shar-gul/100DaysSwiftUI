//
//  AddView.swift
//  iExpense
//
//  Created by Tiago Valente on 14/04/2023.
//

import SwiftUI

struct AddView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name",
                          text: $name)
                
                Picker("Type",
                       selection: $type) {
                    ForEach(types,
                            id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Amount",
                          value: $amount,
                          format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save") {
                    let item = Expense(name: name,
                                       type: type,
                                       amount: amount)
                    modelContext.insert(item)
                    dismiss()
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
