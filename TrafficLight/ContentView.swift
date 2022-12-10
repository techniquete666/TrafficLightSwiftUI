//
//  ContentView.swift
//  TrafficLight
//
//  Created by Vyacheslav on 10.12.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var currentLight = CurrentLight.red
    @State private var lightIsOn: Double = 1
    @State private var lightIsOff = 0.3
    @State private var redLightIsOff = 0.3
    @State private var yellowLightIsOff = 0.3
    @State private var greenLightIsOff = 0.3
    @State private var buttonName = "Start"
    
    var body: some View {
        VStack(spacing: 15.0) {
            CircleView(color: .red)
                .opacity(redLightIsOff)
            CircleView(color: .yellow)
                .opacity(yellowLightIsOff)
            CircleView(color: .green)
                .opacity(greenLightIsOff)
            Spacer()
            
            Button(action: startButtonPressed) {
                Text("\(buttonName)")
                    .font(.largeTitle)
                    .foregroundColor(.white)
            }
            .frame(width: 140.0, height: 40.0)
            .overlay(Capsule().stroke(Color.white, lineWidth: 4))
            .background(Color.blue)
            .cornerRadius(20)
        }.padding()
    }
    
    private func startButtonPressed() {
        if buttonName == "Start" {
            buttonName = "Next"
        }
        
        switch currentLight {
        case .red:
            greenLightIsOff = lightIsOff
            redLightIsOff = lightIsOn
            currentLight = .yellow
        case .yellow:
            redLightIsOff = lightIsOff
            yellowLightIsOff = lightIsOn
            currentLight = .green
        case .green:
            greenLightIsOff = lightIsOn
            yellowLightIsOff = lightIsOff
            currentLight = .red
        }
    }
    
    private enum CurrentLight {
        case red, yellow, green
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
