//
//  ContentView.swift
//  BetterRest
//
//  Created by Tiago Valente on 15/08/2022.
//

import CoreML
import SwiftUI

struct ContentView: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeAmount = 1
    
    private var sleepTime: String {
        calculateBedtime()
    }
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section("When do you want to wake up?") {
                    DatePicker("Please enter a time",
                               selection: $wakeUp,
                               displayedComponents: .hourAndMinute)
                    .labelsHidden()
                }
                Section("Desire amount of sleep") {
                    Stepper("\(sleepAmount.formatted()) hours",
                            value: $sleepAmount,
                            in: 4...12,
                            step: 0.25)
                }
                Section("Daily coffe intake") {
                    Picker("Number of Cups",
                           selection: $coffeAmount) {
                        ForEach(1..<20) { cup in
                            Text(cup == 1 ? "1 cup" : "\(cup) cups")
                        }
                    }
                }
                Section("Your ideal bedtime is...") {
                    Text(sleepTime)
                        .font(.system(size: 35))
                }
            }
            .navigationTitle("Better Rest")
        }
    }
    
    func calculateBedtime() -> String {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let predition = try model.prediction(wake: Double(hour + minute),
                                                 estimatedSleep: sleepAmount,
                                                 coffee: Double(coffeAmount))
            
            let sleepTime = wakeUp - predition.actualSleep

            return sleepTime.formatted(date: .omitted,
                                       time: .shortened)
        } catch {
            return "Error"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
