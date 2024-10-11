//
//  Lesson4View.swift
//  Flashzilla
//
//  Created by Tiago Valente on 09/10/2024.
//

import SwiftUI

struct Lesson4View: View {
    @Environment(\.scenePhase) var scenePhase
    
    var body: some View {
        Text("Hello, world!")
            .onChange(of: scenePhase) { oldPhase, newPhase in
                if newPhase == .active {
                    print("Active")
                } else if newPhase == .inactive {
                    print("Inactive")
                } else if newPhase == .background {
                    print("Background")
                }
            }
    }
}

#Preview {
    Lesson4View()
}
