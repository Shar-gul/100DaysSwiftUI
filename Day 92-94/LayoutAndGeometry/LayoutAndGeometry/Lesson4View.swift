//
//  Lesson4View.swift
//  LayoutAndGeometry
//
//  Created by Tiago Valente on 14/10/2024.
//

import SwiftUI

struct Lesson4View: View {
    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//            .background(.red)
//            .position(x: 100, y: 100)
        
//        Text("Hello, world!")
//            .position(x: 100, y: 100)
//            .background(.red)
        
        Text("Hello, world!")
                .offset(x: 100, y: 100)
                .background(.red)
    }
}

#Preview {
    Lesson4View()
}
