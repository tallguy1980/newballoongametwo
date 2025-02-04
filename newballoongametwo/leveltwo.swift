//
//  leveltwo.swift
//  newballoongametwo
//
//  Created by DUJUAN PUGH on 2/3/25.
//

import Foundation
import SwiftUICore
import SwiftUI

struct Balloon: Identifiable {
    var id = UUID()
    var position: CGPoint
    var size: CGFloat
    var color: String // To differentiate between red, purple, orange, green, and blue balloons
}

struct LevelTwo: View {
    @State private var balloons: [Balloon] = []
    @State private var timer: Timer?
    
    var body: some View {
        ZStack {
            // Loop through the balloons array to display each balloon
            ForEach(balloons) { balloon in
                Image(balloon.color) // Choose balloon image based on color
                    .resizable()
                    .scaledToFit()
                    .frame(width: balloon.size, height: balloon.size)
                    .position(balloon.position)
                    .onTapGesture {
                        removeBalloon(balloon)
                    }
                    .animation(.linear(duration: 2).repeatForever(autoreverses: false), value: balloon.position)
            }
            
            Button(action: {
                // Action to perform when the button is tapped
                print("Button tapped")
            }) {
                Text("Press Start")
                    .font(.largeTitle)
                    .foregroundColor(.orange)
                    .padding()
            }
        }
        .onAppear {
            startBalloonGeneration()
        }
    }
    
    // Starts generating new balloons every second
    private func startBalloonGeneration() {
        timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { _ in
            addBalloon()
        }
    }
    
    // Adds a new balloon with random position, size, and color
    private func addBalloon() {
        let randomX = CGFloat.random(in: 100...UIScreen.main.bounds.width - 100)
        let randomY = UIScreen.main.bounds.minY
        let randomSize = CGFloat.random(in: 100...700) // Balloon size between 100 and 700
        
        // Randomly select a balloon color from the array
        let balloonColors = ["redballoon.png", "blueballoon.png", "yellowballoon.png", "orangeballoon.png", "greenballoon.png", "purpleballoon.png"]
        let randomColor = balloonColors.randomElement() ?? "redballoon.png" // Default to red if selection fails
        
        let newBalloon = Balloon(position: CGPoint(x: randomX, y: randomY), size: randomSize, color: randomColor)
        balloons.append(newBalloon)
        
        // Animate balloons floating upwards
        animateBalloonToTop(balloon: newBalloon)
    }
    
    // Animates a balloon to float upwards
    private func animateBalloonToTop(balloon: Balloon) {
        if let index = balloons.firstIndex(where: { $0.id == balloon.id }) {
            // Moves balloon up by adjusting its position
            balloons[index].position = CGPoint(x: balloon.position.x, y: balloon.position.y + 1300) // Move balloon up
        }
    }
    
    // Removes balloon when tapped
    private func removeBalloon(_ balloon: Balloon) {
        if let index = balloons.firstIndex(where: { $0.id == balloon.id }) {
            balloons.remove(at: index)
        }
    }
}


#Preview {
    LevelTwo()
}
