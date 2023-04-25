//
//  AstronautHorizontalScrollView.swift
//  Moonshot
//
//  Created by Tiago Valente on 24/04/2023.
//

import SwiftUI

struct AstronautHorizontalScrollView: View {
    let crew: [CrewMember]

    var body: some View {
        ScrollView(.horizontal,
                   showsIndicators: false) {
            HStack {
                ForEach(crew, id: \.role) { crewMember in
                    NavigationLink {
                        AstronautView(astronaut: crewMember.astronaut)
                    } label: {
                        HStack {
                            Image(crewMember.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(Capsule())
                                .overlay(
                                    Capsule()
                                    .strokeBorder(.white,
                                                  lineWidth: 1)
                                )
                            VStack(alignment: .leading) {
                                Text(crewMember.astronaut.name)
                                    .foregroundColor(.white)
                                    .font(.headline)
                                
                                Text(crewMember.role)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
    }
    
    init(crew: [CrewMember]) {
        self.crew = crew
    }
}

struct AstronautHorizontalScrollView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        let crew = missions.first?.crew.first
        let astronaut = astronauts[crew!.name]
        let crewMember = CrewMember(role: crew!.role,
                                    astronaut: astronaut!)
        
        AstronautHorizontalScrollView(crew: [crewMember])
    }
}
