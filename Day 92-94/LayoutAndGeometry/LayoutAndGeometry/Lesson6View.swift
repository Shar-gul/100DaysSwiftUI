//
//  Lesson6View.swift
//  LayoutAndGeometry
//
//  Created by Tiago Valente on 16/10/2024.
//

import SwiftUI

struct OuterView: View {
    var body: some View {
        VStack {
            Text("Top")
            InnerView()
                .background(.green)
            Text("Bottom")
        }
    }
}

struct InnerView: View {
    var body: some View {
        HStack {
            Text("Left")
            GeometryReader { proxy in
                Text("Center")
                    .background(.blue)
                    .onTapGesture {
                        print("Global center: \(proxy.frame(in: .global).midX) x \(proxy.frame(in: .global).midY)")
                        print("Custom center: \(proxy.frame(in: .named("Custom")).midX) x \(proxy.frame(in: .named("Custom")).midY)")
                        print("Local center: \(proxy.frame(in: .local).midX) x \(proxy.frame(in: .local).midY)")
                    }
            }
            .background(.orange)
            Text("Right")
        }
    }
}

struct Lesson6View: View {
    var body: some View {
//        GeometryReader { proxy in
//            Text("Hello, World!")
//                .frame(width: proxy.size.width * 0.9)
//                .background(.red)
//        }
        
//        VStack {
//            GeometryReader { proxy in
//                Text("Hello, World!")
//                    .frame(width: proxy.size.width * 0.9, height: 40)
//                    .background(.red)
//            }
//            
//            Text("More text")
//                .background(.blue)
//        }

        OuterView()
            .background(.red)
            .coordinateSpace(name: "Custom")
    }
}

#Preview {
    Lesson6View()
}
