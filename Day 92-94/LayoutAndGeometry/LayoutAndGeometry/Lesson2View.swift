//
//  Lesson2View.swift
//  LayoutAndGeometry
//
//  Created by Tiago Valente on 14/10/2024.
//

import SwiftUI

struct Lesson2View: View {
    var body: some View {
//        Text("Live long and prosper")
//            .frame(width: 300, height: 300, alignment: .topLeading)
        
//        HStack(alignment: .lastTextBaseline) {
//            Text("Live")
//                .font(.caption)
//            Text("long")
//            Text("and")
//                .font(.title)
//            Text("prosper")
//                .font(.largeTitle)
//        }
        
        VStack(alignment: .leading) {
//            Text("Hello, world!")
//                .alignmentGuide(.leading) { d in d[.trailing] }
//            Text("This is a longer line of text")
            ForEach(0..<10) { position in
                        Text("Number \(position)")
                            .alignmentGuide(.leading) { _ in Double(position) * -10 }
                    }
        }
        .background(.red)
        .frame(width: 400, height: 400)
        .background(.blue)
    }
}

#Preview {
    Lesson2View()
}
