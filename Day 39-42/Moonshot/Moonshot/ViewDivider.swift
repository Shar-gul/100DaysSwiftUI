//
//  ViewDivider.swift
//  Moonshot
//
//  Created by Tiago Valente on 24/04/2023.
//

import SwiftUI

struct ViewDivider: View {
    let height: CGFloat
    let color: Color
    let padding: Edge.Set
    
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundColor(.lightBackground)
            .padding(.vertical)
    }
    
    init(height: CGFloat,
         color: Color,
         padding: Edge.Set) {
        self.height = height
        self.color = color
        self.padding = padding
    }
}

struct ViewDivider_Previews: PreviewProvider {
    static var previews: some View {
        ViewDivider(height: 10,
                    color: .blue,
                    padding: .vertical)
    }
}
