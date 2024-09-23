//
//  Lesson1View.swift
//  Animations
//
//  Created by Tiago Valente on 19/09/2024.
//

import SwiftUI

struct Lesson1View: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        Button("Tap Me") {
            animationAmount += 1
        }
        .padding(50)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
        .scaleEffect(animationAmount)
        .animation(.default, value: animationAmount)
    }
}

#Preview {
    Lesson1View()
}
