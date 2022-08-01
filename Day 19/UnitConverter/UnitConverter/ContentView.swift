//
//  ContentView.swift
//  UnitConverter
//
//  Created by Tiago Valente on 29/07/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var units:[String] = ["Celsius", "Fahrenheit", "Kelvin"]
    @State private var inputValue: Double = 0
    @State private var inputUnit: String = "Celsius"
    @State private var outputUnit: String = "Celsius"
    @FocusState private var amountIsFocused: Bool
    
    private var finalConversion: Double {
        let convertedInputValue = convertToCelsius(inputValue,
                                                   from: inputUnit)
        
        let convertedOutputValue = convertFromCelsius(convertedInputValue,
                                                      into: outputUnit)
        
        return convertedOutputValue
    }
    
    private func convertToCelsius(_ value: Double,
                          from selectedTemperature: String) -> Double {
        switch selectedTemperature {
        case "Celsius":
            return value
        case "Fahrenheit":
            return (value - 32) * 5/9
        case "Kelvin":
            return value - 273.15
        default:
            return 0
        }
    }
    
    private func convertFromCelsius(_ value: Double,
                                    into selectedTemperature: String) -> Double {
        switch selectedTemperature {
        case "Celsius":
            return value
        case "Fahrenheit":
            return (value * 9/5) + 32
        case "Kelvin":
            return value + 273.15
        default:
            return 0
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Insert Value",
                              value: $inputValue,
                              formatter: NumberFormatter())
                    .keyboardType(.decimalPad)
                    .focused($amountIsFocused)
                    
                    Picker("Temperature Unit", selection: $inputUnit) {
                        ForEach(units, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Input Unit")
                }
                
                Section {
                    Picker("Temperature Unit", selection: $outputUnit) {
                        ForEach(units, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Convert to")
                }
                
                Section {
                    Text(finalConversion,
                         format: .number)
                    
                } header: {
                    Text("Converted Value")
                }
            }
            .navigationTitle("WeConvert")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
