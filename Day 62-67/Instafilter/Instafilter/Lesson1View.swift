//
//  Lesson1View.swift
//  Instafilter
//
//  Created by Tiago Valente on 19/08/2024.
//

import SwiftUI

struct Lesson1View: View {
    @State private var blurAmount = 0.0
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .blur(radius: blurAmount)
        
        Slider(value: $blurAmount, in: 0...20)
            .onChange(of: blurAmount) { oldValue, newValue in
                print("New value is \(newValue)")
            }
    }
}

#Preview {
    Lesson1View()
}
