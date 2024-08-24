//
//  User.swift
//  People
//
//  Created by Tiago Valente on 18/07/2024.
//

import Foundation

struct User: Codable, Hashable {
    let id: UUID
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: Date
    let tags: [String]
    let friends: [Friend]
}

struct Friend: Codable, Hashable {
    let id: UUID
    let name: String
}
