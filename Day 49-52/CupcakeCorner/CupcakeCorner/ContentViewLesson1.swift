//
//  ContentViewLesson1.swift
//  CupcakeCorner
//
//  Created by Tiago Valente on 09/05/2024.
//

import SwiftUI

struct Response: Codable {
    var results: [Result]
}

struct Result: Codable {
    var trackId: Int?
    var trackName: String?
    var collectionName: String?
}

struct ContentViewLesson1: View {
    // Lesson 1
    @State private var results = [Result]()

    var body: some View {
        List(results, id: \.trackId) { item in
            VStack(alignment: .leading) {
                Text(item.trackName ?? "---")
                    .font(.headline)
                Text(item.collectionName ?? "---")
            }
        }
        .task {
            await loadData()
        }
    }

    func loadData() async {
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity") else {
            print("Invalid URL")
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)

            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                results = decodedResponse.results
            }
        } catch let error as NSError {
            print("\(error)") //Error Domain=Swift.DecodingError Code=2 "(null)"
        }
    }
}

#Preview {
    ContentViewLesson1()
}
