//
//  Lesson2.swift
//  Bookworm
//
//  Created by Tiago Valente on 07/07/2024.
//

import SwiftUI

struct Lesson2: View {
    @AppStorage("notes") private var notes = ""
    
    var body: some View {
        NavigationStack {
            TextField("Enter your text", text: $notes, axis: .vertical)
                .textFieldStyle(.roundedBorder)
                .navigationTitle("Notes")
                .padding()
        }
    }
}

#Preview {
    Lesson2()
}
