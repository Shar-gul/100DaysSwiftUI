//
//  Lesson1View.swift
//  BucketList
//
//  Created by Tiago Valente on 02/09/2024.
//

import SwiftUI

struct User: Comparable, Identifiable {
    let id = UUID()
    var firstName: String
    var lastName: String
    
    static func <(lhs: User, 
                  rhs: User) -> Bool {
        lhs.lastName < rhs.lastName
    }
}

struct Lesson1View: View {
    let values = [1, 5, 3, 6, 2, 9].sorted()
    
    //    var body: some View {
    //        List(values, id: \.self) {
    //            Text(String($0))
    //        }
    //    }
    
    let users = [
            User(firstName: "Arnold", lastName: "Rimmer"),
            User(firstName: "Kristine", lastName: "Kochanski"),
            User(firstName: "David", lastName: "Lister"),
        ].sorted()
    
    var body: some View {
            List(users) { user in
                Text("\(user.lastName), \(user.firstName)")
            }
        }
}

#Preview {
    Lesson1View()
}
