//
//  GreenCircleView.swift
//  TrafficLight
//
//  Created by Vyacheslav on 10.12.2022.
//

import SwiftUI

struct CircleView: View {
    
    let color: Color

    var body: some View {
        Circle()
            .frame(width: 120, height: 120)
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .foregroundColor(color)
            .shadow(radius: 10)
    }
}

struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        CircleView(color: .black)
    }
}
