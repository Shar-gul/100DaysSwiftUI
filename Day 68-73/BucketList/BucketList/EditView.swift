//
//  EditView.swift
//  BucketList
//
//  Created by Tiago Valente on 06/09/2024.
//

import SwiftUI

struct EditView: View {
    @Environment(\.dismiss) var dismiss
    private var onSave: (Location) -> Void
    
    @Bindable private var viewModel: ViewModel

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Place name", text: $viewModel.name)
                    TextField("Description", text: $viewModel.description)
                }
                
                Section("Nearby…") {
                    switch viewModel.loadingState {
                    case .loaded:
                        ForEach(viewModel.pages, id: \.pageid) { page in
                            Text(page.title)
                                .font(.headline)
                            + Text(": ") +
                            Text(page.description)
                                .italic()
                        }
                    case .loading:
                        Text("Loading…")
                    case .failed:
                        Text("Please try again later.")
                    }
                }
            }
            .navigationTitle("Place details")
            .toolbar {
                Button("Save") {
                    var newLocation = viewModel.location
                    newLocation.id = UUID()
                    newLocation.name = viewModel.name
                    newLocation.description = viewModel.description
                    
                    onSave(newLocation)
                    dismiss()
                }
            }
            .task {
                await viewModel.fetchNearbyPlaces()
            }
        }
    }
    
    init(location: Location,
         onSave: @escaping (Location) -> Void) {
        self._viewModel = Bindable(wrappedValue: ViewModel(location: location))
        self.onSave = onSave
    }
}

#Preview {
    EditView(location: Location.example,
             onSave: { _ in })
}
