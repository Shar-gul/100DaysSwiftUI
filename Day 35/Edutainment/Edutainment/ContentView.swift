//
//  ContentView.swift
//  Edutainment
//
//  Created by Tiago Valente on 24/09/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var showingGameOver = false
    private let finalScoreTitle = "Game Over"
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score: Int = 0
    
    @State private var multiplicationTable = 2
    @State private var numberOfQuestions = 5
    @State private var questionNumber: Int = 1
    
    @State private var multiplicationValue = Int.random(in: 1...10)
    @State private var inputValue: String = ""
    
    var body: some View {
        VStack {
            Stepper("Which multiplication table do you want to practice?") {
                if multiplicationTable < 10 {
                    multiplicationTable += 1
                }
            } onDecrement: {
                if multiplicationTable > 2 {
                    multiplicationTable -= 1
                }
            }
            .padding()
            
            Text("Selected Multiplication Table \(multiplicationTable)")
            
            Picker("How many question do you want?", selection: $numberOfQuestions){
                Text("5 Questions").tag(5)
                Text("10 Questions").tag(10)
                Text("20 Questions").tag(20)
            }
            .pickerStyle(.segmented)
            .padding()
            
            HStack {
                Spacer()
                Text("\(multiplicationTable) x \(multiplicationValue) = ")
                TextField("", text: $inputValue)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 55)
                Spacer()
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .onSubmit {
                generateQuestions()
            }
        }
        .alert(scoreTitle,
                isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        }
        .alert(finalScoreTitle,
                       isPresented: $showingGameOver) {
                    Button("New Game", action: reset)
                } message: {
                    Text("You correctly answered \(score) questions")
                }
    }
    
    private func generateQuestions() {
        if multiplicationTable * multiplicationValue == Int(inputValue) {
            scoreTitle = "Correct"
            score += 1
        } else {
            scoreTitle = "Wrong!"
        }
        showingScore = true
    }
    
    private func askQuestion() {
        if questionNumber == numberOfQuestions {
            showingGameOver = true
        } else {
            inputValue = ""
            multiplicationValue = Int.random(in: 1...10)
        }
        questionNumber = questionNumber + 1
    }
    
    private func reset() {
        questionNumber = 1
        inputValue = ""
        multiplicationValue = Int.random(in: 1...10)
        score = 0
    }
}

#Preview {
    ContentView()
}
