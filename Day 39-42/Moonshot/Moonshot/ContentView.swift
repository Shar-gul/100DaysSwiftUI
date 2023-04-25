//
//  ContentView.swift
//  Moonshot
//
//  Created by Tiago Valente on 17/04/2023.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @AppStorage("showGrid") private var showingGrid = false
    
    var body: some View {
        NavigationView {
            Group {
                if showingGrid {
                    GridLayoutView(astronauts: astronauts,
                                   missions: missions)
                } else {
                    ListLayoutView(astronauts: astronauts,
                                   missions: missions)
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                Button {
                    showingGrid.toggle()
                } label: {
                    if showingGrid {
                        Text("Show as List")
                    } else {
                        Text("Show as Grid")
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
