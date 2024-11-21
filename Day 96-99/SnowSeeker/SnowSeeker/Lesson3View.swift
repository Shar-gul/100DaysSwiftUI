//
//  Lesson3View.swift
//  SnowSeeker
//
//  Created by Tiago Valente on 15/11/2024.
//

import SwiftUI

struct UserView: View {
    var body: some View {
        Group {
            Text("Name: Paul")
            Text("Country: England")
            Text("Pets: Luna and Arya")
        }
        .font(.title)
    }
}

struct Lesson3View: View {
//    @State private var layoutVertically = false
//    
//    var body: some View {
//        Button {
//            layoutVertically.toggle()
//        } label: {
//            if layoutVertically {
//                VStack {
//                    UserView()
//                }
//            } else {
//                HStack {
//                    UserView()
//                }
//            }
//        }
//    }
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
//        if horizontalSizeClass == .compact {
//            VStack(content: UserView.init)
//        } else {
//            HStack(content: UserView.init)
//        }
        ViewThatFits {
            Rectangle()
                .frame(width: 500, height: 200)

            Circle()
                .frame(width: 200, height: 200)
        }
    }
}

#Preview {
    Lesson3View()
}
