//
//  ContentView.swift
//  BucketList
//
//  Created by Tiago Valente on 01/09/2024.
//

import MapKit
import SwiftUI

struct ContentView: View {
    private enum myMapStyle {
        case standard
        case hybrid
    }
    
    @State private var viewModel = ViewModel()
    @State private var mapStyleType: myMapStyle = .standard
    
    let startPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 56, longitude: -3),
            span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
        )
    )
    
    var body: some View {
        if viewModel.isUnlocked {
            VStack {
                MapReader { proxy in
                    Map(initialPosition: startPosition) {
                        ForEach(viewModel.locations) { location in
                            Annotation(location.name, coordinate: location.coordinate) {
                                Image(systemName: "star.circle")
                                    .resizable()
                                    .foregroundStyle(.red)
                                    .frame(width: 44, height: 44)
                                    .background(.white)
                                    .clipShape(.circle)
                                    .onLongPressGesture {
                                        viewModel.selectedPlace = location
                                    }
                            }
                        }
                    }
                    .mapStyle(convertStyle())
                    .onTapGesture { position in
                        if let coordinate = proxy.convert(position, from: .local) {
                            viewModel.addLocation(at: coordinate)
                        }
                    }
                    .sheet(item: $viewModel.selectedPlace) { place in
                        EditView(location: place) {
                            viewModel.update(location: $0)
                        }
                    }
                }
                Picker("Map Type", selection: $mapStyleType) {
                    Text("Standard").tag(myMapStyle.standard)
                    Text("Hybrid").tag(myMapStyle.hybrid)
                }
                .pickerStyle(.segmented)
            }
        } else {
            Button("Unlock Places", action: viewModel.authenticate)
                .padding()
                .background(.blue)
                .foregroundStyle(.white)
                .clipShape(.capsule)
        }
    }
    
    private func convertStyle() -> MapStyle {
        switch mapStyleType {
        case .standard:
            return .standard
        case .hybrid:
            return .hybrid
        }
    }
}

#Preview {
    ContentView()
}
