//
//  ContentView.swift
//  WordScramble
//
//  Created by Tiago Valente on 30/08/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    private let minWordLength = 3
    
    private var score: Int {
        var count = 0
        for word in usedWords {
            count += word.count
        }
        return count
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter your word", text: $newWord)
                    .autocapitalization(.none)
                    .padding()
                List {
                    ForEach(usedWords, id: \.self) { word in
                        HStack {
                            Image(systemName: "\(word.count).circle.fill")
                            Text(word)
                        }
                        .accessibilityElement()
                        .accessibilityLabel(word)
                        .accessibilityHint("\(word.count) letters")  
                    }
                }
                Text("Score: \(score)")
            }
            .navigationTitle(rootWord)
            .navigationBarItems(leading: Button("New Game") { self.startGame() })
            .onSubmit(addNewWord)
            .onAppear(perform: startGame)
            .alert(errorTitle, isPresented: $showingError) {
                Button("OK", role: .cancel) { }
            } message: {
                Text(errorMessage)
            }
        }
    }
    
    private func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard answer.count > 0 else { return }
        
        guard isSmall(word: answer) else {
            wordError(title: "Word is smaller than three characters", message: "Try a bigger word")
            return
        }
        
        guard isSameAsRoot(word: answer) else {
            wordError(title: "Word is the same as the original", message: "Try another word different from \(rootWord)")
            return
        }
        
        guard isOrignal(word: answer) else {
            wordError(title: "Word used already", message: "Be more original")
            return
        }
        
        guard isPossible(word: answer) else {
            wordError(title: "Word not possible", message: "You can't spell that world from \(rootWord)")
            return
        }
        
        guard isReal(word: answer) else {
            wordError(title: "Word not recognized", message: "You can just make them up, you know!")
            return
        }
        
        withAnimation {
            usedWords.insert(answer, at: 0)
        }
        newWord = ""
    }
    
    private func startGame() {
        withAnimation {
            usedWords.removeAll()
        }
        
        if let startWordsURL = Bundle.main.url(forResource: "start",
                                               withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL) {
                let allWords = startWords.components(separatedBy: "\n")
                rootWord = allWords.randomElement() ?? "silkworm"

                return
            }
        }
        
        fatalError("Could not load start.txt from bundle.")
    }
    
    private func isSmall(word: String) -> Bool {
        if word.count > minWordLength {
            return true
        }
        
        return false
    }

    private func isSameAsRoot(word: String) -> Bool {
        !(word == rootWord)
    }
    
    private func isOrignal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    private func isPossible(word: String) -> Bool {
        var tempWord = rootWord
        
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }
        
        return true
    }
    
    private func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word,
                                                            range: range,
                                                            startingAt: 0,
                                                            wrap: false,
                                                            language: "en")
        
        return misspelledRange.location == NSNotFound
    }
    
    private func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
