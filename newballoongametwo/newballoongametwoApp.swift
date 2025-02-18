//
//  newballoongametwoApp.swift
//  newballoongametwo
//
//  Created by DUJUAN PUGH on 2/7/25.
//

import SwiftUI
import AVFoundation

@main
struct newballoongametwoApp: App {
    @State private var audioPlayergame:AVAudioPlayer?
    var body: some Scene {
        WindowGroup {
            ZStack{
              //  Slashview()
                ContentView()
                    .onAppear(){
                        kidsgame()
                    }
        
            }

        }
    }
    private func kidsgame() {
        if let url = Bundle.main.url(forResource: "kidsgame", withExtension: "mp3") {
            do {
                audioPlayergame = try AVAudioPlayer(contentsOf: url)
                audioPlayergame?.numberOfLoops = -1
                audioPlayergame?.play()
            } catch {
                print("kidsgame: \(error)")
            }
        }
    }
}
