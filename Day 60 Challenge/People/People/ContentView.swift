//
//  ContentView.swift
//  People
//
//  Created by Tiago Valente on 18/07/2024.
//

import Foundation
import SwiftUI

struct ContentView: View {
    @State private var users = [User]()
    
    var body: some View {
        NavigationStack {
            List(users, id: \.id) { user in
                NavigationLink(value: user) {
                    VStack(alignment: .leading) {
                        Text(user.name)
                            .font(.headline)
                        Text(user.isActive ? "Active" : "Inactive")
                            .foregroundStyle(user.isActive ? .green : .red)
                    }
                }
            }
            .navigationDestination(for: User.self) { user in
                UserDetailView(user: user)
            }
            .navigationTitle("Users")
        }.task {
            await loadData()
        }
    }
    
    func loadData() async {
        print("👽 Load Data 👽")
        let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
        let request = URLRequest(url: url)
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            if let jsonUsers = try? decoder.decode([User].self, from: data) {
//                print("Users \(jsonUsers)")
                users = jsonUsers
            }
        } catch let error as NSError {
            print("\(error)")
        }
        
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            guard let httpResponse = response as? HTTPURLResponse,
//                  (200...299).contains(httpResponse.statusCode) else {
//                return
//            }
//            
//            if let data = data {
//                let decoder = JSONDecoder()
//                decoder.dateDecodingStrategy = .iso8601
//                
//                if let jsonUsers = try? decoder.decode([User].self, from: data) {
//                    print("Users \(jsonUsers)")
//                    users = jsonUsers
//                } else {
//                    print("Decoding failed!!")
//                }
//            } else {
//                print("Something wrong!!")
//            }
//        }.resume()
    }
}

#Preview {
    ContentView()
}
