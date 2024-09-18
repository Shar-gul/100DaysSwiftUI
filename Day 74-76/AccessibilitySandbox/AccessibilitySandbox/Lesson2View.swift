//
//  Lesson2View.swift
//  AccessibilitySandbox
//
//  Created by Tiago Valente on 16/09/2024.
//

import SwiftUI

struct Lesson2View: View {
    var body: some View {
//        Image(decorative: "character")
        
//        Image(.character)
//            .accessibilityHidden(true)
        
//        VStack {
//            Text("Your score is")
//            Text("1000")
//                .font(.title)
//        }
//        .accessibilityElement(children: .combine)
        
        VStack {
            Text("Your score is")
            Text("1000")
                .font(.title)
        }
        .accessibilityElement()
        .accessibilityLabel("Your score is 1000")
    }
}

#Preview {
    Lesson2View()
}
