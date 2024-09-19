//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Tiago Valente on 09/05/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var model = Model()
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("Select your cake type", selection: $model.order.type) {
                        ForEach(Model.Order.types.indices, id: \.self) {
                            Text(Model.Order.types[$0])
                        }
                    }
                    Stepper("Number of cakes: \(model.order.quantity)", value: $model.order.quantity, in: 3...20)
                }
                Section {
                    Toggle("Any special requests?", isOn: $model.order.specialRequestEnabled)
                    if model.order.specialRequestEnabled {
                        Toggle("Add extra frosting", isOn: $model.order.extraFrosting)
                        Toggle("Add extra sprinkles", isOn: $model.order.addSprinkles)
                    }
                }
                Section {
                    NavigationLink("Delivery Details") {
                        AddressView(model: model)
                    }
                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }
}

#Preview {
    ContentView()
}
