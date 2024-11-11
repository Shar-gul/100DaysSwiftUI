//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Tiago Valente on 14/10/2024.
//

import SwiftUI

struct ContentView: View {
    let fadeOutDistance: CGFloat = 200
    let minScale: CGFloat = 0.5

    var body: some View {
        GeometryReader { fullView in
            ScrollView(.vertical) {
                ForEach(0..<50) { index in
                    GeometryReader { proxy in
                        
                        let offsetY = proxy.frame(in: .global).minY
                        let opacity = offsetY / fadeOutDistance
                        
                        let scale = max(minScale, offsetY / fullView.size.height)
                        
                        let hue = min(Double(offsetY / fullView.size.height) * 0.6, 1.0)
                        let saturation: Double = 0.8
                        let brightness: Double = 0.8
                        let color = Color(hue: hue, saturation: saturation, brightness: brightness)
                        
                        Text("Row #\(hue)")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .background(color)
                            .rotation3DEffect(.degrees(proxy.frame(in: .global).minY - fullView.size.height / 2) / 5, axis: (x: 0, y: 1, z: 0))
                            .opacity(opacity)
                            .scaleEffect(scale)
                    }
                    .frame(height: 40)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
