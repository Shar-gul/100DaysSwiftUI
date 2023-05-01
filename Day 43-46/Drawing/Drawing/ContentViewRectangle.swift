//
//  ContentViewRectangle.swift
//  Drawing
//
//  Created by Tiago Valente on 28/04/2023.
//

import SwiftUI

struct ContentViewRectangle: View {
    @State private var colorRectangle = 0.0

    struct ColorCyclingRectangle: View {
        var amount = 0.0
        let steps: Int = 100

        var body: some View {
            ZStack {
                ForEach(0..<steps, id: \.self) { value in
                    Rectangle()
                        .inset(by: Double(value))
                        .strokeBorder(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    color(for: value, brightness: 1),
                                    color(for: value, brightness: 0.5)
                                ]),
                                startPoint: .top,
                                endPoint: .bottom
                            ),
                            lineWidth: 2
                        )
                }
            }
            .drawingGroup()
        }

        func color(for value: Int,
                   brightness: Double) -> Color {
            var targetHue = Double(value) / Double(steps) + amount

            if targetHue > 1 {
                targetHue -= 1
            }

            return Color(hue: targetHue,
                         saturation: 1,
                         brightness: brightness)
        }
    }
    
    var body: some View {
        VStack {
            ColorCyclingRectangle(amount: colorRectangle)
                .frame(width: 300, height: 300)

            Slider(value: $colorRectangle)
        }
    }
}

struct ContentViewRectangle_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewRectangle()
    }
}
