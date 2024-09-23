//
//  Lesson4View.swift
//  Animations
//
//  Created by Tiago Valente on 19/09/2024.
//

import SwiftUI

struct Lesson4View: View {
    @State private var animationAmount = 0.0
    
    var body: some View {
        Button("Tap Me") {
            withAnimation(.spring(duration: 1, bounce: 0.5)) {
                animationAmount += 360
            }
        }
        .padding(50)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
        .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
    }
}

#Preview {
    Lesson4View()
}
