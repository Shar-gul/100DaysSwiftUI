//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Tiago Valente on 01/08/2022.
//

import SwiftUI

struct FlagImage: View {
    var imageName: String
    
    var body: some View {
        Image(imageName)
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(radius: 5)
    }
}

struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var score: Int = 0
    
    private let finalScoreTitle = "Game Over"
    @State private var gameRound: Int = 1
    @State private var showingGameOver = false

    @State private var selectedFlag = 0
    
    @State private var rotationAmount = 0.0
    @State private var isAnimatingOpacity = false
    @State private var scaleAmount: CGFloat = 1.0
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)],
                           center: .top,
                           startRadius: 200,
                           endRadius: 700)
            .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Guess the flag")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                            
                        
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                        } label: {
                            FlagImage(imageName: countries[number])
                        }
                        .opacity(isAnimatingOpacity ? (number == correctAnswer ? 1 : 0.25) : 1)
                        .rotation3DEffect(.degrees(number == selectedFlag ? rotationAmount : 0),
                                          axis: (x: 0, y: 1, z: 0))
                        .scaleEffect( number == correctAnswer ? 1 : scaleAmount,
                                                            anchor: .center)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle,
                isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(score)")
        }
        .alert(finalScoreTitle,
               isPresented: $showingGameOver) {
            Button("New Game", action: reset)
        } message: {
            Text("Your score is \(score)")
        }
    }
    
    func flagTapped(_ number: Int) {
        selectedFlag = number
        
        if number == correctAnswer {
            scoreTitle = "Correct"
            score = score + 1
        } else {
            scoreTitle = "Wrong, that’s the flag of \(countries[number])"
            if score > 0 {
                score = score - 1
            } else {
                score = 0
            }
        }
        
        withAnimation(.easeInOut) {
            isAnimatingOpacity = true
        }
        
        withAnimation {
            rotationAmount = 360
            scaleAmount = 0.6
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        if gameRound == 8 {
            showingGameOver = true
        } else {
            countries.shuffle()
            correctAnswer = Int.random(in: 0...2)
        }
        
        isAnimatingOpacity = false
        rotationAmount = 0
        scaleAmount = 1.0
        
        gameRound = gameRound + 1
    }
    
    func reset() {
        score = 0
        gameRound = 1
        
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice("iPhone 13")
            .previewInterfaceOrientation(.portrait)
        }
    }
}
