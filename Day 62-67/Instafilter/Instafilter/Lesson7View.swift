//
//  Lesson7View.swift
//  Instafilter
//
//  Created by Tiago Valente on 19/08/2024.
//

import StoreKit
import SwiftUI

struct Lesson7View: View {
    @Environment(\.requestReview) var requestReview
    
    var body: some View {
        Button("Leave a review") {
            requestReview()
        }
    }
}

#Preview {
    Lesson7View()
}
