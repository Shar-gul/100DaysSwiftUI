//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Tiago Valente on 20/06/2024.
//

import Foundation
import SwiftUI

private enum AlertType {
    case confirmation
    case error
}

struct CheckoutView: View {
    @ObservedObject var model: Model
    
    @State private var alert: Alert = Alert(title: Text("Checkout"))
    @State private var showingAlert = false
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3) { image in
                        image
                            .resizable()
                            .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 233)

                Text("Your total is \(model.order.cost, format: .currency(code: "USD"))")
                    .font(.title)

                Button("Place Order") {
                    Task {
                        await placeOrder()
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Check out")
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
        .alert(isPresented: $showingAlert) { () -> Alert in
            alert
        }
    }
    
    func placeOrder() async {
        guard let encoded = try? JSONEncoder().encode(model.order) else {
            createAlert(type: .error,
                        message: "Failed to encode order")
            return
        }
        
        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            
            let decodedOrder = try JSONDecoder().decode(Model.Order.self, from: data)
            let message = "Your order for \(decodedOrder.quantity)x \(Model.Order.types[decodedOrder.type].lowercased()) cupcakes is on its way!"
            createAlert(type: .confirmation,
                        message: message)
        } catch {
            createAlert(type: .error,
                        message: error.localizedDescription)
        }
    }
    
    private func createAlert(type: AlertType,
                             message: String) {
        switch type {
        case .confirmation:
            alert = Alert(title: Text("Thank you!"),
                          message: Text(message),
                          dismissButton: .default(Text("OK")))
        case .error:
            alert = Alert(title: Text("Error!"),
                          message: Text(message),
                          dismissButton: .default(Text("OK")))
        }
        showingAlert = true
    }
}

#Preview {
    CheckoutView(model: Model())
}
