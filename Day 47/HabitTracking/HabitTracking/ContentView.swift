//
//  ContentView.swift
//  HabitTracking
//
//  Created by Tiago Valente on 01/05/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var activities = Activities()
    @State private var showingAddActivity = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(activities.items) { item in
                    NavigationLink {
                        ActivityDetailView(items: activities,
                                           activityID: item.id )
                    } label: {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(.headline)
                                Text(item.description)
                                    .lineLimit(1)
                                    .font(.footnote)
                                Text("Task completed \(item.timesCompleted.description) time(s)")
                                    .font(.body)
                            
                            }
                        
                        }
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("Track Habit")
            .toolbar {
                    Button {
                        showingAddActivity = true
                    } label: {
                        Image(systemName: "plus")
                    }
            }
            .sheet(isPresented: $showingAddActivity) {
                AddView(activities: activities)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        activities.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
