//
//  AnimatedBackground.swift
//  GIPHY World
//
//  Created by Mikhail Borisov on 24/11/22.
//

import SwiftUI

struct AnimatedBackground: View {
    @State var start = UnitPoint(x: 0, y: 0)
    @State var end = UnitPoint(x: 1, y: 1)
    
    let timer = Timer.publish(every: 1, on: .main, in: .default).autoconnect()
    let colors: [Color] = [
        .red.opacity(0.3),
        .purple.opacity(0.3),
        .blue.opacity(0.3),
        .orange.opacity(0.3),
        .green.opacity(0.3),
        .yellow.opacity(0.3)
    ]
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: colors), startPoint: start, endPoint: end)
                .onReceive(timer, perform: { _ in
                    withAnimation(.easeInOut(duration: 3).repeatForever()) {
                        self.start = UnitPoint(x: 4, y: 0)
                        self.end = UnitPoint(x: 0, y: 2)
                        self.start = UnitPoint(x: -4, y: 30)
                        self.start = UnitPoint(x: 4, y: 0)
                    }
                })
        }
    }
}

struct AnimatedBackground_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedBackground()
    }
}
