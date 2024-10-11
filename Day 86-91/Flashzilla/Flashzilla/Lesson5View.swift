//
//  Lesson5View.swift
//  Flashzilla
//
//  Created by Tiago Valente on 09/10/2024.
//

import SwiftUI

// ReduceMotion
func withOptionalAnimation<Result>(_ animation: Animation? = .default, _ body: () throws -> Result) rethrows -> Result {
    if UIAccessibility.isReduceMotionEnabled {
        return try body()
    } else {
        return try withAnimation(animation, body)
    }
}

struct Lesson5View: View {
    // DifferentiateWithoutColor
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor

    // ReduceMotion
    @Environment(\.accessibilityReduceMotion) var reduceMotion
    @State private var scale = 1.0
    
    // ReduceTransparency
    @Environment(\.accessibilityReduceTransparency) var reduceTransparency
    
    var body: some View {
        // DifferentiateWithoutColor
//        HStack {
//            if differentiateWithoutColor {
//                Image(systemName: "checkmark.circle")
//            }
//            
//            Text("Success")
//        }
//        .padding()
//        .background(differentiateWithoutColor ? .black : .green)
//        .foregroundStyle(.white)
//        .clipShape(.capsule)
        
        // ReduceMotion
//        Button("Hello, World!") {
////            if reduceMotion {
////                scale *= 1.5
////            } else {
////                withAnimation {
////                    scale *= 1.5
////                }
////            }
//            withOptionalAnimation {
//                scale *= 1.5
//            }
//        }
//        .scaleEffect(scale)
        
        // ReduceTransparency
        Text("Hello, World!")
            .padding()
            .background(reduceTransparency ? .black : .black.opacity(0.5))
            .foregroundStyle(.white)
            .clipShape(.capsule)
    }
}

#Preview {
    Lesson5View()
}
