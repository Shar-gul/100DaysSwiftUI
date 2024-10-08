//
//  EditProspect.swift
//  HotProspects
//
//  Created by Tiago Valente on 07/10/2024.
//

import SwiftUI

struct EditProspect: View {    
    @Bindable var prospect: Prospect
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Name") {
                    TextField("Prospect", text: $prospect.name)
                    
                }
                Section("Email adress") {
                    TextField("Email adress", text: $prospect.emailAddress)
                }
            }
            .navigationTitle("Edit details")
        }
    }
}

#Preview {
    EditProspect(prospect: Prospect(name: "Paul",
                                    emailAddress: "Hudson",
                                    isContacted: false,
                                    creationDate: .now))
}
