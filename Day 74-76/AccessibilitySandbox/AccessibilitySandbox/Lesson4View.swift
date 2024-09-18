//
//  Lesson4View.swift
//  AccessibilitySandbox
//
//  Created by Tiago Valente on 16/09/2024.
//

import SwiftUI

struct Lesson4View: View {
    var body: some View {
        Button("John Fitzgerald Kennedy") {
            print("Button tapped")
        }
        .accessibilityInputLabels(["John Fitzgerald Kennedy", "Kennedy", "JFK"])
    }
}

#Preview {
    Lesson4View()
}
