//
//  Card.swift
//  Flashzilla
//
//  Created by Tiago Valente on 09/10/2024.
//

import Foundation

struct Card: Codable, Identifiable {
    var id = UUID()
    var prompt: String
    var answer: String

    static let example = Card(prompt: "Who played the 13th Doctor in Doctor Who?", answer: "Jodie Whittaker")
}
