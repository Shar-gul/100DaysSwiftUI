//
//  ContentViewLesson4.swift
//  CupcakeCorner
//
//  Created by Tiago Valente on 27/05/2024.
//

import SwiftUI

@Observable
class User: Codable {
    enum CodingKeys: String, CodingKey {
        case _name = "name"
    }
    var name = "Taylor"
}

struct ContentViewLesson4: View {
    // Lesson 4
    var body: some View {
        Button("Encode Taylor", action: encodeTaylor)
    }
    
    func encodeTaylor() {
        let data = try! JSONEncoder().encode(User())
        let str = String(decoding: data, as: UTF8.self)
        print(str)
    }
}

#Preview {
    ContentViewLesson4()
}
