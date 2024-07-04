//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Tiago Valente on 20/06/2024.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var model: Model
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $model.order.name)
                TextField("Street address", text: $model.order.streetAddress)
                TextField("City", text: $model.order.city)
                TextField("Zip", text: $model.order.zip)
            }
            
            Section {
                NavigationLink("Check out") {
                    CheckoutView(model: model)
                }
            }
            .disabled(model.order.hasValidAddress == false)
        }
        .navigationTitle("Delivery details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    AddressView(model: Model())
}
