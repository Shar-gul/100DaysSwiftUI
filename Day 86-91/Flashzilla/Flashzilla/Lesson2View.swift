//
//  Lesson2View.swift
//  Flashzilla
//
//  Created by Tiago Valente on 08/10/2024.
//

import SwiftUI

struct Lesson2View: View {
    var body: some View {
//        ZStack {
//            Rectangle()
//                .fill(.blue)
//                .frame(width: 300, height: 300)
//                .onTapGesture {
//                    print("Rectangle tapped!")
//                }
//
//            Circle()
//                .fill(.red)
//                .frame(width: 300, height: 300)
//                .contentShape(.rect)
//                .onTapGesture {
//                    print("Circle tapped!")
//                }
////                .allowsHitTesting(false)
//        }
        
        VStack {
            Text("Hello")
            Spacer().frame(height: 100)
            Text("World")
        }
        // Make whole area tappable
        .contentShape(.rect)
        .onTapGesture {
            print("VStack tapped!")
        }
    }
}

#Preview {
    Lesson2View()
}
