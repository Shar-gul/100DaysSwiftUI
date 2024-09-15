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
    
    private var selectedMapStyle: MapStyle {
        return switch mapStyleType {
        case .standard: .standard
        case .hybrid: .hybrid
        }
    }
    
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
                    .mapStyle(selectedMapStyle)
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
                .alert(isPresented: $viewModel.showingAlert, content: {
                    Alert(title: Text(viewModel.alertContent?.title ?? ""),
                          message: Text(viewModel.alertContent?.message ?? ""),
                          dismissButton: viewModel.alertContent?.buildButton())
                })
        }
    }
}

private extension AlertContent {
    func buildButton() -> Alert.Button {
        return switch self.dismissButtonType {
        case .default:
            Alert.Button.default(Text(self.dismissButtonText ?? "Ok"))
        case .cancel:
            Alert.Button.cancel(Text(self.dismissButtonText ?? "Cancel"))
        }
    }
}

#Preview {
    ContentView()
}
