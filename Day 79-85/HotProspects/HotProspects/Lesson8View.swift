//
//  Lesson8View.swift
//  HotProspects
//
//  Created by Tiago Valente on 02/10/2024.
//

import SamplePackage
import SwiftUI

struct Lesson8View: View {
    let possibleNumbers = 1...60
    
    var results: String {
        let selected = possibleNumbers.random(7).sorted()
        let strings = selected.map(String.init)
        
        return strings.formatted()
    }
    
    var body: some View {
        Text(results)
    }
}

#Preview {
    Lesson8View()
}
