//
//  ContentView.swift
//  newballoongametwo
//
//  Created by DUJUAN PUGH on 2/3/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            ZStack {
                Image ("WALLA5.0")
                    .resizable(capInsets: .init(top: 100, leading: 100, bottom: 0, trailing: 0))
                    .scaledToFill()
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                NavigationLink(destination: LevelTwo()){
                    Text("Play")
                        .font(.largeTitle)
                        .padding()
                        .background(in: RoundedRectangle(cornerRadius: 15))
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
