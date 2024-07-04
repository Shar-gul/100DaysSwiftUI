//
//  ObservableOrder.swift
//  CupcakeCorner
//
//  Created by Tiago Valente on 03/07/2024.
//

import Foundation

class ObservableOrder: ObservableObject {
    @Published var order: Order

    init(order: Order) {
        self.order = order
    }
}
