//
//  UserDetailView.swift
//  People
//
//  Created by Tiago Valente on 21/07/2024.
//

import Foundation
import SwiftUI

struct UserDetailView: View {
    @State var user: User
    
    var body: some View {
        ScrollView {
            Text(user.name)
                .font(.title)
            
            Text("Age: \(user.age)")
            
            Text(user.email)
            
            Text(user.registered.formatted(date: .abbreviated,
                                           time: .shortened))
                .font(.footnote)
                .foregroundStyle(.secondary)
            
            Text("Friends")
                .font(.subheadline)
                .padding()
            ForEach(user.friends, id: \.id) { friend in
                VStack {
                    Text(friend.name)
                        .font(.system(size: 27))
                }
            }
        }
        .scrollBounceBehavior(.basedOnSize)
    }
}

#Preview {
    let friendSam: Friend = Friend(id: UUID(),
                                 name: "Samwise Gamgee")
    let friendMery: Friend = Friend(id: UUID(),
                                 name: "Meriadoc Brandibuck")
    let friendPipin: Friend = Friend(id: UUID(),
                                 name: "Peregrin Took")
    let user: User = User(id: UUID(),
                          isActive: true,
                          name: "Frodo Baggins",
                          age: 23,
                          company: "Baggins Travels",
                          email: "frodo.baggins@baggingstravels.com",
                          address: "High Road 20, Shire",
                          about: "Bilbo's nephew",
                          registered: .now,
                          tags: [],
                          friends: [friendSam,
                                   friendMery,
                                   friendPipin])
    
    return UserDetailView(user: user)
}
