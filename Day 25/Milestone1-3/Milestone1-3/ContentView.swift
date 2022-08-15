//
//  ContentView.swift
//  Milestone1-3
//
//  Created by Tiago Valente on 11/08/2022.
//

import SwiftUI

struct GestureView: View {
    var gesture: Gesture
    
    var body: some View {
        switch gesture {
        case .rock:
            return Text("✊🏻")
        case .paper:
            return Text("✋🏻")
        case .scissor:
            return Text("✌🏻")
        }
    }
}

struct GoalView: View {
    var goal: Bool
    
    var body: some View {
        Text("You should \(goal ? "Win" : "Loose")")
    }
}

struct ScoreView: View {
    var score: Int
    
    var body: some View {
        VStack {
            Text("Player Score")
            Text("\(score)")
        }.padding()
    }
}

struct ContentView: View {
    private let numberPlays = 10
    private let game = RockPaperScissor()
    
    @State private var userShouldWin: Bool = Bool.random()
    @State private var appGesture: Int = Int.random(in: 0...2)
    
    @State private var playerScore: Int = 0
    @State private var showingGameOver: Bool = false
    @State private var gameRound: Int = 1
    
    var body: some View {
        VStack {
            VStack {
                Text("App Move")
                GestureView(gesture: Gesture(rawValue: appGesture)!)
                    .font(.system(size: 60))
                    .padding(.bottom, 20)
                GoalView(goal: userShouldWin)
            }.padding()
            
            HStack {
                ForEach(0..<3) { number in
                    Button {
                        validatePlay(Gesture(rawValue: number)!,
                                     appGesture: Gesture(rawValue: appGesture)!)
                    } label: {
                        GestureView(gesture: Gesture(rawValue: number)!)
                    }.font(.system(size: 30))
                }
            }
            
            ScoreView(score: playerScore)
        }
        .alert("Game Over",
                isPresented: $showingGameOver) {
             Button("New Game", action: resetGame)
         } message: {
             Text("Your score is \(playerScore)")
         }
    }
    
    private func validatePlay(_ userGesture: Gesture,
                              appGesture: Gesture) {
        if gameRound == numberPlays {
            showingGameOver = true
        } else {
            let winningPlay = game.checkPlay(userGesture: userGesture,
                                            appGesture: appGesture,
                                            userShouldWin: userShouldWin)
            
            playerScore = winningPlay ? playerScore + 1 : playerScore - 1

            gameRound = gameRound + 1
            resetPlay()
        }
    }
    
    private func resetGame() {
        playerScore = 0
        gameRound = 1
        
        userShouldWin.toggle()
        appGesture = Int.random(in: 0...2)
    }
    
    private func resetPlay() {
        userShouldWin.toggle()
        appGesture = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
