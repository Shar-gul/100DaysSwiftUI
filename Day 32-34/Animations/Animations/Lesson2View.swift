//
//  Lesson2View.swift
//  Animations
//
//  Created by Tiago Valente on 19/09/2024.
//

import SwiftUI

struct Lesson2View: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        Button("Tap Me") {
//            animationAmount += 1
        }
        .padding(50)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(.circle)
//        .scaleEffect(animationAmount)
//        .blur(radius: (animationAmount - 1) * 3)
//        .animation(.linear, value: animationAmount)
//        .animation(.spring(duration: 1, bounce: 0.9), value: animationAmount)
        .overlay(
            Circle()
                .stroke(.red)
                .scaleEffect(animationAmount)
                .opacity(2 - animationAmount)
                .animation(
                    .easeOut(duration: 1)
                    .repeatForever(autoreverses: false),
//                    .easeInOut(duration: 1)
        //            .delay(1),
        //            .repeatCount(3, autoreverses: true),
//                        .repeatForever(autoreverses: true),
                    value: animationAmount
                )
        )
        .onAppear {
            animationAmount = 2
        }
    }
}

#Preview {
    Lesson2View()
}
