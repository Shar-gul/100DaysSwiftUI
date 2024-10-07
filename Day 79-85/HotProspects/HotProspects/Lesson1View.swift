//
//  Lesson1View.swift
//  HotProspects
//
//  Created by Tiago Valente on 30/09/2024.
//

import SwiftUI

struct Lesson1View: View {
    @State private var selection = Set<String>()
    
    let users = ["Tohru", "Yuki", "Kyo", "Momiji"]

    var body: some View {
        List(users, id: \.self, selection: $selection) { user in
            Text(user)
        }
        
        if selection.isEmpty == false {
            Text("You selected \(selection.formatted())")
        }
        
        EditButton()
    }
}

#Preview {
    Lesson1View()
}
