//
//  Lesson4View.swift
//  Instafilter
//
//  Created by Tiago Valente on 19/08/2024.
//

import SwiftUI

struct Lesson4View: View {
    var body: some View {
//        ContentUnavailableView("No snippets", systemImage: "swift")
        
//        ContentUnavailableView("No snippets",
//                               systemImage: "swift",
//                               description: Text("You don't have any saved snippets yet."))
        
        ContentUnavailableView {
            Label("No snippets", systemImage: "swift")
        } description: {
            Text("You don't have any saved snippets yet.")
        } actions: {
            Button("Create Snippet") {
                // create a snippet
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    Lesson4View()
}
