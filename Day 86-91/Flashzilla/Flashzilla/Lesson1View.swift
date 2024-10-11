//
//  Lesson1View.swift
//  Flashzilla
//
//  Created by Tiago Valente on 08/10/2024.
//

import SwiftUI

struct Lesson1View: View {
    // Magnify Gesture
//    @State private var currentAmount = 0.0
//    @State private var finalAmount = 1.0
    
    // Rotation Gesture
//    @State private var currentAmount = Angle.zero
//    @State private var finalAmount = Angle.zero
    
    // Sequence Gestures
    // how far the circle has been dragged
    @State private var offset = CGSize.zero
    // whether it is currently being dragged or not
    @State private var isDragging = false
    
    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
        // Tap Gesture
//            .onTapGesture(count: 2) {
//                print("Double tapped!")
//            }
        
        // Long Press Gesture
//            .onLongPressGesture(minimumDuration: 2) {
//                print("Long pressed!")
//            } onPressingChanged: { inProgress in
//                print("In progress: \(inProgress)!")
//            }
        
        // Magnify Gesture
//            .scaleEffect(finalAmount + currentAmount)
//            .gesture(
//                MagnifyGesture()
//                    .onChanged { value in
//                        currentAmount = value.magnification - 1
//                    }
//                    .onEnded { value in
//                        finalAmount += currentAmount
//                        currentAmount = 0
//                    }
//            )
        // Rotation Gesture
//            .rotationEffect(currentAmount + finalAmount)
//            .gesture(
//                RotateGesture()
//                    .onChanged { value in
//                        currentAmount = value.rotation
//                    }
//                    .onEnded { value in
//                        finalAmount += currentAmount
//                        currentAmount = .zero
//                    }
//            )
        
        // Multiple Gesture
//        
//        VStack {
//            Text("Hello, World!")
//                .onTapGesture {
//                    print("Text tapped")
//                }
//        }
//        // High Priority Gesture
////        .highPriorityGesture(
//        // Simultaneous Gesture
//        .simultaneousGesture(
//            TapGesture()
//                .onEnded {
//                    print("VStack tapped")
//                }
//        )
        
        // a drag gesture that updates offset and isDragging as it moves around
        let dragGesture = DragGesture()
            .onChanged { value in offset = value.translation }
            .onEnded { _ in
                withAnimation {
                    offset = .zero
                    isDragging = false
                }
            }
        
        // a long press gesture that enables isDragging
        let pressGesture = LongPressGesture()
            .onEnded { value in
                withAnimation {
                    isDragging = true
                }
            }
        
        // a combined gesture that forces the user to long press then drag
        let combined = pressGesture.sequenced(before: dragGesture)
        
        // a 64x64 circle that scales up when it's dragged, sets its offset to whatever we had back from the drag gesture, and uses our combined gesture
        Circle()
            .fill(.red)
            .frame(width: 64, height: 64)
            .scaleEffect(isDragging ? 1.5 : 1)
            .offset(offset)
            .gesture(combined)
    }
}

#Preview {
    Lesson1View()
}
