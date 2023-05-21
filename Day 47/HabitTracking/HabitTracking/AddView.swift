//
//  AddView.swift
//  HabitTracking
//
//  Created by Tiago Valente on 02/05/2023.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var activities: Activities
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var description = ""
    @State private var timesCompleted = 0
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name",
                          text: $name)
                
                TextField("Description",
                          text: $description)
            }
            .navigationTitle("Add new Activity")
            .toolbar {
                Button("Save") {
                    let item = ActivityItem(name: name,
                                            description: description,
                                            timesCompleted: timesCompleted)
                    activities.addActivity(item)
                    dismiss()
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(activities: Activities())
    }
}
