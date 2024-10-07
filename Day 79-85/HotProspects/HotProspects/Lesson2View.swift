//
//  Lesson2View.swift
//  HotProspects
//
//  Created by Tiago Valente on 01/10/2024.
//

import SwiftUI

struct Lesson2View: View {
    @State private var selectedTab = "One"
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Button("Show Tab 2") {
                selectedTab = "Two"
            }
            .tabItem {
                Label("One", systemImage: "star")
            }
            .tag("One")
            
            Text("Tab 2")
                .tabItem {
                    Label("Two", systemImage: "circle")
                }
                .tag("Two")
        }
    }
}

#Preview {
    Lesson2View()
}
