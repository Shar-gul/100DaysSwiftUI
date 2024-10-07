//
//  Lesson6View.swift
//  HotProspects
//
//  Created by Tiago Valente on 02/10/2024.
//

import SwiftUI

struct Lesson6View: View {
    var body: some View {
        List {
            Text("Taylor Swift")
                .swipeActions {
                    Button("Delete", systemImage: "minus.circle", role: .destructive) {
                        print("Deleting")
                    }
                }
                .swipeActions(edge: .leading) {
                    Button("Pin", systemImage: "pin") {
                        print("Pinning")
                    }
                    .tint(.orange)
                }
        }
    }
}

#Preview {
    Lesson6View()
}
