//
//  leveltwo.swift
//  newballoongametwo
//
//  Created by DUJUAN PUGH on 2/3/25.
//

import Foundation
import SwiftUICore
import SwiftUI
import AVFoundation

//struct Balloon: Identifiable {
//    var id = UUID()
//    var position: CGPoint
//    var size: CGFloat
//    var color: String // To differentiate between red, purple, orange, green, and blue balloons
//}

struct LevelTwo: View {
    @State private var balloons: [Balloon] = []
    @State private var timer: Timer?
    @State private var score: Int = 0  // Add score variable
    @State private var audioPlayer: AVAudioPlayer? // Declare audioPlayer as a state variable
    @State private var gamestarted: Bool = false
   
    var body: some View {

        ZStack {
            Image("balloongamebackground2")
                .resizable(capInsets: .init(top: -500, leading: -500, bottom: 100, trailing: 100))
                .scaledToFill()
                .imageScale(.large)
                .foregroundStyle(.tint)
            
            // Loop through the balloons array to display each balloon
            ForEach(balloons) { balloon in
                Image(balloon.color) // Choose balloon image based on color
                    .resizable()
                    .scaledToFit()
                    .frame(width: balloon.size, height: balloon.size)
                    .position(balloon.position)
                    .onTapGesture {
                        removeBalloon(balloon) // Call removeBalloon when tapped
                        score += 1 // Increment score when balloon is tapped
                    }
                    .animation(.linear(duration: 2).repeatForever(autoreverses: false), value: balloon.position)
            }
            
            // Score Text
            VStack {
                Text("Score: \(score)") // Display the score
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black.opacity(0.5))
                    .cornerRadius(10)
                    .padding(.top, 40)
                
                Spacer()
            }
            Button(action: {
                // Action to perform when the button is tapped
                print("Button tapped")
                gamestarted = true
                
                startBalloonGeneration()
            }) {
                Text("Press Start")
                    .font(.largeTitle)
                    .foregroundColor(gamestarted ? .clear : .purple)
                    .padding()
            }
        
        }
        
    }
    
    // Starts generating new balloons every second
    private func startBalloonGeneration() {
        timer = Timer.scheduledTimer(withTimeInterval: 6, repeats: true) { _ in
            addBalloon()
        }
    }
    
    // Adds a new balloon with random position, size, and color
    private func addBalloon() {
        let randomX = CGFloat.random(in: 100...UIScreen.main.bounds.width - 80)
        _ = UIScreen.main.bounds.minY
        let randomSize = CGFloat.random(in: 200...700) // Balloon size between 200 and 700
        
        // Randomly select a balloon color from the array
        let balloonColors = ["redballoon.png", "blueballoon.png", "yellowballoon.png", "orangeballoon.png", "greenballoon.png", "purpleballoon.png"]
        let randomColor = balloonColors.randomElement() ?? "redballoon.png" // Default to red if selection fails
        
        let initialY = UIScreen.main.bounds.maxY + randomSize / 2
        let newBalloon = Balloon(position: CGPoint(x: randomX, y: initialY), size: randomSize, color: randomColor)
        balloons.append(newBalloon)
        
        // Animate balloons floating upwards
        animateBalloonToTop(balloon: newBalloon)
    }
    
    // Animates a balloon to float upwards
    private func animateBalloonToTop(balloon: Balloon) {
        if let index = balloons.firstIndex(where: { $0.id == balloon.id }) {
            // Start a timer or use `withAnimation` to smoothly animate the balloon's movement upwards
            let finalY = -balloon.size
            withAnimation(.linear(duration: 10)) {
                balloons[index].position = CGPoint(x: balloon.position.x, y: finalY) // Animate the position
            }
        }
    }
    
    // Play the pop sound
    private func playPopSound() {
        if let url = Bundle.main.url(forResource: "pop", withExtension: "mp3") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            } catch {
                print("Error playing pop sound: \(error)")
              
            }
        }
    }

    
    // Removes balloon when tapped
    private func removeBalloon(_ balloon: Balloon) {
        // Play pop sound
        playPopSound()
        
        if let index = balloons.firstIndex(where: { $0.id == balloon.id }) {
            balloons.remove(at: index)
        }
    }
}

#Preview {
    LevelTwo()
}


