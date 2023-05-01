//
//  ContentView.swift
//  Drawing
//
//  Created by Tiago Valente on 28/04/2023.
//

import SwiftUI

struct Arrow: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX + 35, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX + 35, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX - 35, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX - 35, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        path.closeSubpath()

        return path
    }
}

struct ContentView: View {
    @State private var lineWidth = 1.0

    var body: some View {
        Arrow()
            .stroke(.blue,
                    style: StrokeStyle(lineWidth: lineWidth,
                                       lineCap: .square,
                                       lineJoin: .bevel))
            .frame(width: 200, height: 200)
            .onTapGesture {
                withAnimation {
                    lineWidth = Double.random(in: 1...40)
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
