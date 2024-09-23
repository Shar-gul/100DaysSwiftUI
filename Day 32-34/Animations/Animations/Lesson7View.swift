//
//  Lesson7View.swift
//  Animations
//
//  Created by Tiago Valente on 20/09/2024.
//

import SwiftUI

struct Lesson7View: View {
    @State private var isShowingRed = false
    
    var body: some View {
        VStack {
            Button("Tap Me") {
                withAnimation {
                    isShowingRed.toggle()
                }
            }
            
            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
//                    .transition(.scale)
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
            }
        }
    }
}

#Preview {
    Lesson7View()
}
