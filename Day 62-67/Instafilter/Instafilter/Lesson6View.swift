//
//  Lesson6View.swift
//  Instafilter
//
//  Created by Tiago Valente on 19/08/2024.
//

import SwiftUI

struct Lesson6View: View {
    var body: some View {
//        ShareLink(item: URL(string: "https://www.hackingwithswift.com")!)
        
//        ShareLink(item: URL(string: "https://www.hackingwithswift.com")!, 
//                  subject: Text("Learn Swift here"),
//                  message: Text("Check out the 100 Days of SwiftUI!"))
        
//        ShareLink(item: URL(string: "https://www.hackingwithswift.com")!) {
//            Label("Spread the word about Swift", systemImage: "swift")
//        }
        
        let example = Image(.example)

        ShareLink(item: example, preview: SharePreview("Singapore Airport", image: example)) {
            Label("Click to share", systemImage: "airplane")
        }

    }
}

#Preview {
    Lesson6View()
}
