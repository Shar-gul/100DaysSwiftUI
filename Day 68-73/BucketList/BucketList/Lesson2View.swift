//
//  Lesson2View.swift
//  BucketList
//
//  Created by Tiago Valente on 02/09/2024.
//

import SwiftUI
import Foundation

extension FileManager {
    func readWrite(content: String,
                   file: String) -> String {
        let data = Data(content.utf8)
        let url = URL.documentsDirectory.appending(path: file)
        
        guard let _ = try? data.write(to: url,
                                      options: [.atomic, .completeFileProtection]) else {
            fatalError("Failed to write to \(file) file")
        }
        
        guard let input = try? String(contentsOf: url) else {
            fatalError("Failed to get content from \(file) file")
        }
        
        return input
    }
}

struct Lesson2View: View {
    var body: some View {
        Button("Read and Write") {
            let input = FileManager.default.readWrite(content: "Stuff and other stuff",
                                                      file: "ShoppingList.txt")
            print(input)
        }
    }
}

#Preview {
    Lesson2View()
}
