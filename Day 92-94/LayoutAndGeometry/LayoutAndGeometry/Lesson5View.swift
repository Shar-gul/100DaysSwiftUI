//
//  Lesson5View.swift
//  LayoutAndGeometry
//
//  Created by Tiago Valente on 16/10/2024.
//

import SwiftUI

struct Lesson5View: View {
    var body: some View {
//        Image(.example)
//            .resizable()
//            .scaledToFit()
//            .frame(width: 300, height: 300)
        
//        GeometryReader { proxy in
//            Image(.example)
//                .resizable()
//                .scaledToFit()
//                .frame(width: proxy.size.width * 0.8, height: 300)
//        }
        
        HStack {
            Text("IMPORTANT")
                .frame(width: 200)
                .background(.blue)

            GeometryReader { proxy in
                Image(.example)
                    .resizable()
                    .scaledToFit()
                    .frame(width: proxy.size.width * 0.8)
                    .frame(width: proxy.size.width, height: proxy.size.height)
            }
        }
    }
}

#Preview {
    Lesson5View()
}
