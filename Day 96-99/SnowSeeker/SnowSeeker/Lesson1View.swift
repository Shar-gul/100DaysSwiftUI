//
//  Lesson1View.swift
//  SnowSeeker
//
//  Created by Tiago Valente on 15/11/2024.
//

import SwiftUI

struct Lesson1View: View {
    var body: some View {
        NavigationSplitView(preferredCompactColumn: .constant(.detail)) {
        //NavigationSplitView(columnVisibility: .constant(.all)) {
            NavigationLink("Primary") {
                Text("New view")
            }
        } detail: {
            Text("Content")
                .navigationTitle("Content View")
                .toolbar(.hidden, for: .navigationBar)
        }
        .navigationSplitViewStyle(.balanced)
    }
}

#Preview {
    Lesson1View()
}
