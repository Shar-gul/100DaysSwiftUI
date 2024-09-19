//
//  ContentViewLesson3.swift
//  CupcakeCorner
//
//  Created by Tiago Valente on 27/05/2024.
//

import SwiftUI

struct ContentViewLesson3: View {
    // Lesson 3
    @State private var username = ""
    @State private var email = ""
    
    var disableForm: Bool {
        username.count < 5 || email.count < 5
    }
    
    var body: some View {
        Form {
            Section {
                TextField("Username", text: $username)
                TextField("Email", text: $email)
            }
            
            Section {
                Button("Create account") {
                    print("")
                }
            }
            .disabled(disableForm)
        }
    }
}

#Preview {
    ContentViewLesson3()
}
