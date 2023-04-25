//
//  ListLayoutView.swift
//  Moonshot
//
//  Created by Tiago Valente on 25/04/2023.
//

import SwiftUI

struct ListLayoutView: View {
    let astronauts: [String: Astronaut]
    let missions: [Mission]
    
    var body: some View {
        List(missions) { mission in
            NavigationLink {
                MissionView(mission: mission,
                            astronauts: astronauts)
            } label: {
                HStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .padding()
                    
                    Text(mission.formattedLauchDateBig)
                        .foregroundColor(.secondary)
                        .padding(.top)
                }
            }
            .listRowBackground(Color.darkBackground)
        }
        .background(Color.darkBackground)
        .listStyle(.plain)
    }
}

struct ListLayoutView_Previews: PreviewProvider {
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    
    static var previews: some View {
        ListLayoutView(astronauts: astronauts,
                       missions: missions)
    }
}
