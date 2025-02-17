//
//  ContentViewTwo.swift
//  newballoongametwo
//
//  Created by DUJUAN PUGH on 2/6/25.
//

import SwiftUICore
import SwiftUI
import AVFoundation

struct ContentView: View {  // Renamed to ContentViewTwo
    var body: some View {
        NavigationStack {
            ZStack {
                // Background image setup
                Image("balloongamebackground")
                    .ignoresSafeArea()
//                    .resizable()
//                    .scaledToFill()
//                    .imageScale(.medium)
//                    .frame(maxWidth: .infinity, maxHeight: .infinity) // Ensuring the image takes the whole space
//                    .clipped() // Prevent overflow
                VStack {
                    HStack {
                        //                    HStack {
                        // First NavigationLink
                        NavigationLink(destination: LevelTwo()) {
                            Image("greencolorsbutton") // Replace this with your desired image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 300, height: 300) // Adjust the size as needed
                            //                                .padding()
                            //.background(RoundedRectangle(cornerRadius: 5))
                        }
                        
                        // Second NavigationLink
                        NavigationLink(destination: LevelThree()) {
                            Image("purplenumbersbutton") // Replace this with your desired image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 300, height: 300) // Adjust the size as needed
                            //                                .padding()
                            //.background(RoundedRectangle(cornerRadius: 5))
                        }
                        //                    }
                        //                    .padding() // Padding for the HStack
                        
                        // Third NavigationLink
                        NavigationLink(destination: Levelfour()) {
                            Image("redalphabetbutton") // Replace this with your desired image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 300, height: 300) // Adjust the size as needed
                            //                            .padding()
                            //.background(RoundedRectangle(cornerRadius: 5))
                        }
                        
                        // fourth NavigationLink
                        NavigationLink(destination: Level5())
                        {
                            Image("orangeshapesbutton") // Replace this with your desired image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 300, height: 300) // Adjust the size as needed
                            //                            .padding()
                            //.background(RoundedRectangle(cornerRadius: 5))
                        }
                        
                    }
                    .padding() // Padding for the HStack
                    Image(.walla)
                        .resizable()
                        .frame(width: 300, height: 300)
                }
            }
//            .padding() // Padding for the VStack
            }
        }
    }
  


#Preview {
    ContentView()  // Updated preview to match the new name
}


