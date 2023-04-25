//
//  ContentView.swift
//  CustomViewModifier
//
//  Created by Tiago Valente on 10/08/2022.
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
            .padding()
    }
}

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .prominentTitle()
            .frame(maxWidth: .infinity,
                   maxHeight: .infinity)
            .background(.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View {
    func prominentTitle() -> some View {
        modifier(Title())
    }
}
