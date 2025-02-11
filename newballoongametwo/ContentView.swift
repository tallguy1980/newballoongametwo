//
//  ContentViewTwo.swift
//  newballoongametwo
//
//  Created by DUJUAN PUGH on 2/6/25.
//

import SwiftUICore
import SwiftUI
import AVFoundation

struct newballoongamwtwo: View {  // Renamed to ContentViewTwo
    var body: some View {
        NavigationStack {
            ZStack {
                // Background image setup
                Image("balloongamebackground")
                    .resizable()
                    .scaledToFill()
                    .imageScale(.large)
                    .frame(maxWidth: .infinity, maxHeight: .infinity) // Ensuring the image takes the whole space
                    .clipped() // Prevent overflow
                
                VStack {
                    HStack {
                        // First NavigationLink
                        NavigationLink(destination: LevelTwo()) {
                            Image("greencolorsbutton") // Replace this with your desired image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100) // Adjust the size as needed
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 5))
                        }
                        
                        // Second NavigationLink
                        NavigationLink(destination: LevelThree()) {
                            Image("purplenumbersbutton") // Replace this with your desired image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100) // Adjust the size as needed
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 5))
                        }
                    }
                    .padding() // Padding for the HStack
                    
                    // Third NavigationLink
                    NavigationLink(destination: Levelfour()) {
                        Image("redalphabetbutton") // Replace this with your desired image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100) // Adjust the size as needed
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 5))
                    }
                }
                .padding() // Padding for the VStack
            }
        }
    }
}

#Preview {
    newballoongamwtwo()  // Updated preview to match the new name
}


