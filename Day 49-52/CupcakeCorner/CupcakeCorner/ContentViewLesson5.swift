//
//  ContentViewLesson5.swift
//  CupcakeCorner
//
//  Created by Tiago Valente on 27/05/2024.
//

import CoreHaptics
import SwiftUI

struct ContentViewLesson5: View {
    // Lesson 5
//    @State private var counter = 0
    
    @State private var engine: CHHapticEngine?
    
    var body: some View {
//        Button("Tap Count: \(counter)") {
//            counter += 1
//        }
//        .sensoryFeedback(.increase,
//                         trigger: counter)
        
        Button("Play Haptic", action: complexSuccess2)
            .onAppear(perform: prepareHaptics)
    }
    
    func prepareHaptics() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        do {
            engine = try CHHapticEngine()
            try engine?.start()
        } catch {
            print("There was an error creating the engine: \(error.localizedDescription)")
        }
    }
    
    func complexSuccess() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        
        var events = [CHHapticEvent]()
        
        let intensity = CHHapticEventParameter(parameterID: .hapticIntensity,
                                               value: 1)
        let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, 
                                               value: 1)
        let event = CHHapticEvent(eventType: .hapticTransient,
                                  parameters: [intensity, sharpness],
                                  relativeTime: 0)
        events.append(event)
        
        do {
            let pattern = try CHHapticPattern(events: events, parameters: [])
            let player = try engine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {
            print("Failed to play pattern: \(error.localizedDescription)")
        }
    }
    
    func complexSuccess2() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        
        var events = [CHHapticEvent]()
        
        for i in stride(from: 0, to: 1, by: 0.1){
            let intensity = CHHapticEventParameter(parameterID: .hapticIntensity,
                                                   value: Float(i))
            let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness,
                                                   value: Float(i))
            let event = CHHapticEvent(eventType: .hapticTransient,
                                      parameters: [intensity, sharpness],
                                      relativeTime: i)
            events.append(event)
        }
        
        for i in stride(from: 0, to: 1, by: 0.1){
            let intensity = CHHapticEventParameter(parameterID: .hapticIntensity,
                                                   value: Float(1 - i))
            let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness,
                                                   value: Float(1 - i))
            let event = CHHapticEvent(eventType: .hapticTransient,
                                      parameters: [intensity, sharpness],
                                      relativeTime: 1 + i)
            events.append(event)
        }
       
        do {
            let pattern = try CHHapticPattern(events: events, parameters: [])
            let player = try engine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {
            print("Failed to play pattern: \(error.localizedDescription)")
        }
    }
}

#Preview {
    ContentViewLesson5()
}
