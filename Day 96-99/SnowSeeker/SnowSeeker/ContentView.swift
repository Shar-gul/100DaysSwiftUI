//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Tiago Valente on 15/11/2024.
//

import SwiftUI

struct ContentView: View {
    private enum SortSelection {
        case none
        case alphabetically
        case countryAlphabetically
    }
    
    let resorts: [Resort] = Bundle.main.decode("resorts.json")
    
    @State private var favorites = Favorites()
    @State private var searchText = ""
    @State private var sortedSelection: SortSelection = .none
    
    private var sortedResorts: [Resort] {
        switch sortedSelection {
        case .none:
            filteredResorts
        case .alphabetically:
            filteredResorts.sorted { $0.name < $1.name }
        case .countryAlphabetically:
            // Sort by country & sort alphabetically within same country.
            filteredResorts.sorted {
                $0.country == $1.country ? $0.name < $1.name : $0.country < $1.country
            }
        }
    }
    
    private var filteredResorts: [Resort] {
        if searchText.isEmpty {
            resorts
        } else {
            resorts.filter { $0.name.localizedStandardContains(searchText) }
        }
    }
    
    var body: some View {
        NavigationSplitView {
            List(sortedResorts) { resort in
                NavigationLink(value: resort) {
                    HStack {
                        Image(resort.country)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 25)
                            .clipShape(
                                .rect(cornerRadius: 5)
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.black, lineWidth: 1)
                            )

                        VStack(alignment: .leading) {
                            Text(resort.name)
                                .font(.headline)
                            Text("\(resort.runs) runs")
                                .foregroundStyle(.secondary)
                        }
                        
                        if favorites.contains(resort) {
                            Spacer()
                            Image(systemName: "heart.fill")
                            .accessibilityLabel("This is a favorite resort")
                                .foregroundStyle(.red)
                        }
                    }
                }
            }
            .navigationTitle("Resorts")
            .navigationDestination(for: Resort.self) { resort in
                ResortView(resort: resort)
            }
            .toolbar {
                Menu("Sort", systemImage: "arrow.up.arrow.down") {
                    Picker("Sort", selection: $sortedSelection) {
                        Text("None")
                            .tag(SortSelection.none)
                        
                        Text("Sort Alphabetically")
                            .tag(SortSelection.alphabetically)
                        
                        Text("Sort by Country")
                            .tag(SortSelection.countryAlphabetically)
                    }
                }
            }
            .searchable(text: $searchText, prompt: "Search for a resort")
        } detail: {
            WelcomeView()
        }
        .environment(favorites)
    }
}

#Preview {
    ContentView()
}
