//
//  ActivityDetailView.swift
//  HabitTracking
//
//  Created by Tiago Valente on 02/05/2023.
//

import SwiftUI

struct ActivityDetailView: View {
    @ObservedObject var items: Activities
    var activityID: UUID

    var activity: ActivityItem {
        items.getActivityByID(activityID)
    }
    
    var body: some View {
        Form {
            Text(activity.name)
            Text(activity.description)
            Stepper(
                onIncrement: { self.updateActivity(by: 1) },
                onDecrement: { self.updateActivity(by: -1) },
                label: { Text("Completed \(activity.timesCompleted) times") }
            )
        }
        .navigationTitle("Edit Activity")
    }
    
    private func updateActivity(by change: Int) {
        var activity = self.activity
        activity.timesCompleted += change
        self.items.updateActivity(activity)
    }
}

struct ActivityDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityDetailView(items: Activities(),
                           activityID: UUID())
    }
}
