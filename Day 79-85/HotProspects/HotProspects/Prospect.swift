//
//  Prospect.swift
//  HotProspects
//
//  Created by Tiago Valente on 03/10/2024.
//

import Foundation
import SwiftData

@Model
class Prospect {
    var name: String
    var emailAddress: String
    var creationDate: Date
    var isContacted: Bool
    
    init(name: String, emailAddress: String, isContacted: Bool, creationDate: Date) {
        self.name = name
        self.emailAddress = emailAddress
        self.isContacted = isContacted
        self.creationDate = creationDate
    }
}
