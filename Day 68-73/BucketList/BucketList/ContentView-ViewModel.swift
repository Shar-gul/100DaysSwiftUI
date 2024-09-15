//
//  ContentView-ViewModel.swift
//  BucketList
//
//  Created by Tiago Valente on 09/09/2024.
//

import CoreLocation
import LocalAuthentication
import MapKit

enum AlertDismissButtonType {
    case `default`
    case cancel
}

struct AlertContent {
    var title: String
    var message: String
    var dismissButtonType: AlertDismissButtonType
    var dismissButtonText: String?
}

extension ContentView {
    @Observable
    class ViewModel {
        let savePath = URL.documentsDirectory.appending(path: "SavedPlaces")
        
        private(set) var locations: [Location]
        var selectedPlace: Location?
        var isUnlocked = false
        var showingAlert: Bool = false
        var alertContent: AlertContent?
        
        init() {
            do {
                let data = try Data(contentsOf: savePath)
                locations = try JSONDecoder().decode([Location].self, from: data)
            } catch {
                locations = []
            }
        }
        
        func addLocation(at point: CLLocationCoordinate2D) {
            let newLocation = Location(id: UUID(),
                                       name: "New location",
                                       description: "",
                                       latitude: point.latitude,
                                       longitude: point.longitude)
            locations.append(newLocation)
            save()
        }
        
        func update(location: Location) {
            guard let selectedPlace else { return }
            
            if let index = locations.firstIndex(of: selectedPlace) {
                locations[index] = location
                save()
            }
        }
        
        func save() {
            do {
                let data = try JSONEncoder().encode(locations)
                try data.write(to: savePath, options: [.atomic, .completeFileProtection])
            } catch {
                print("Unable to save data.")
            }
        }
        
        func authenticate() {
            let context = LAContext()
            var error: NSError?

            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                let reason = "Please authenticate yourself to unlock your places."

                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in

                    if success {
                        self.isUnlocked = true
                        self.showingAlert = false
                    } else {
                        // error
                        self.showingAlert = true
                        self.alertContent = AlertContent(title: "Error",
                                                         message: "Number of tries exceded, face not recognized.",
                                                         dismissButtonType: .default,
                                                         dismissButtonText: "Ok")
                    }
                }
            } else {
                // no biometrics
                self.showingAlert = true
                self.alertContent = AlertContent(title: "Warning",
                                                 message: "No Biometric evalueation available on this device.",
                                                 dismissButtonType: .cancel,
                                                 dismissButtonText: nil)
            }
        }
    }
}
