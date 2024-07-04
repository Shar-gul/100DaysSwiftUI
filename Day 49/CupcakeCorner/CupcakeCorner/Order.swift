//
//  Order.swift
//  CupcakeCorner
//
//  Created by Tiago Valente on 20/06/2024.
//

import Foundation

class Model: ObservableObject {
    @Published var order = Order()
    
    struct Order: Codable {
        init() {}
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            type = try container.decode(Int.self, forKey: ._type)
            quantity = try container.decode(Int.self, forKey: ._quantity)
            
            extraFrosting = try container.decode(Bool.self, forKey: ._extraFrosting)
            addSprinkles = try container.decode(Bool.self, forKey: ._addSprinkles)
            
            name = try container.decode(String.self, forKey: ._name)
            streetAddress = try container.decode(String.self, forKey: ._streetAddress)
            city = try container.decode(String.self, forKey: ._city)
            zip = try container.decode(String.self, forKey: ._zip)
        }
        
        enum CodingKeys: String, CodingKey {
            case _type = "type"
            case _quantity = "quantity"
            case _specialRequestEnabled = "specialRequestEnabled"
            case _extraFrosting = "extraFrosting"
            case _addSprinkles = "addSprinkles"
            case _name = "name"
            case _city = "city"
            case _streetAddress = "streetAddress"
            case _zip = "zip"
        }
        
        static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
        
        var type = 0
        var quantity = 3
        
        var specialRequestEnabled = false {
            didSet {
                if specialRequestEnabled == false {
                    extraFrosting = false
                    addSprinkles = false
                }
            }
        }
        var extraFrosting = false
        var addSprinkles = false

        var name: String {
            get {
                readFromUserDefaults(key: "name")
            }
            set {
                writeOnUserDefaults(value: newValue,
                                    key: "name")
            }
        }
        var streetAddress: String {
            get {
                readFromUserDefaults(key: "streetAddress")
            }
            set {
                writeOnUserDefaults(value: newValue,
                                    key: "streetAddress")
            }
        }
        var city: String {
            get {
                readFromUserDefaults(key: "city")
            }
            set {
                writeOnUserDefaults(value: newValue,
                                    key: "city")
            }
        }
        var zip: String {
            get {
                readFromUserDefaults(key: "zip")
            }
            set {
                writeOnUserDefaults(value: newValue,
                                    key: "zip")
            }
        }
        
        var hasValidAddress: Bool {
            // Challenge 1
            if name.isEmpty || name.isAllWhitespaces ||
                streetAddress.isEmpty || streetAddress.isAllWhitespaces ||
                city.isEmpty || city.isAllWhitespaces ||
                zip.isEmpty || zip.isAllWhitespaces {
                return false
            }
            
            return true
        }
        
        var cost: Decimal {
            // $2 per cake
            var cost = Decimal(quantity) * 2
            
            // complicated cakes cost more
            cost += (Decimal(type) / 2)
            
            // $1/cake for extra frosting
            if extraFrosting {
                cost += Decimal(quantity)
            }
            
            // $0.50/cake for sprinkles
            if addSprinkles {
                cost += Decimal(quantity) / 2
            }
            
            return cost
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            
            try container.encode(type, forKey: ._type)
            try container.encode(quantity, forKey: ._quantity)
            
            try container.encode(extraFrosting, forKey: ._extraFrosting)
            try container.encode(addSprinkles, forKey: ._addSprinkles)
            
            try container.encode(name, forKey: ._name)
            try container.encode(streetAddress, forKey: ._streetAddress)
            try container.encode(city, forKey: ._city)
            try container.encode(zip, forKey: ._zip)
        }
        
        private func readFromUserDefaults(key: String) -> String {
            UserDefaults.standard.object(forKey: key) as? String ?? ""
        }
        
        private func writeOnUserDefaults(value: String, key: String) {
            UserDefaults.standard.setValue(value, forKey: key)
        }
    }
}

extension String {
    // Challenge 1
    var isAllWhitespaces: Bool {
        guard !self.isEmpty else { return false }
        return self.drop { $0 == " " }.isEmpty
    }
}
