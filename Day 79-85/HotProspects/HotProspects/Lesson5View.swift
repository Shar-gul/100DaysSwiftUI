//
//  Lesson5View.swift
//  HotProspects
//
//  Created by Tiago Valente on 01/10/2024.
//

import SwiftUI

struct Lesson5View: View {
    @State private var backgroundColor = Color.red

        var body: some View {
            VStack {
                Text("Hello, World!")
                    .padding()
                    .background(backgroundColor)

                Text("Change Color")
                    .padding()
                    .contextMenu {
                        Button("Red", systemImage: "checkmark.circle.fill", role: .destructive) {
                            backgroundColor = .red
                        }

                        Button("Green") {
                            backgroundColor = .green
                        }

                        Button("Blue") {
                            backgroundColor = .blue
                        }
                    }
            }
        }
}

#Preview {
    Lesson5View()
}
