//
//  Slashview.swift
//  newballoongametwo
//
//  Created by DUJUAN PUGH on 2/7/25.
//

import SwiftUI

struct Slashview: View {
    @State private var scale: CGFloat = 1
    @State private var rotation: Double = 0.0
    @State private var opacity: Double = 0.0
    @State private var shouldshowShowContentview = false
    
    
    var body: some View {
        NavigationView {
            ZStack {
                
                Color.blue
                
                VStack {
                    Text("Walla Walla Bing Bang")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding(.bottom)
                    Spacer()
                }
                Image("walla")
                    .resizable()
                    .frame(width: 120, height: 120)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                    .scaleEffect(scale)
                    .opacity(opacity)
                
                    .onAppear {
                        withAnimation(Animation.easeInOut(duration: 1.0).delay(0.5)) {
                            scale = 1.2
                            rotation += 360
                            opacity = 1.0
                            
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {shouldshowShowContentview = true
                        }
                    }
            }
           // .edgesIgnoringSafeArea(.all)
            //NavigationLINK("".destination,: ContentView().isActive,:
            //  $shouldshowShowContentview)
        }
    }
}

//struct Splashview: PreviewProvider {
   // static var previews: some View {
        //Slashview()
   //}
//}
//#Preview {
    //Slashview()
//}
