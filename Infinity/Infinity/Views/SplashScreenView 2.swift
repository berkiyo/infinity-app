/* FILE = SplashScreenView.swift
 AUTHOR = Berk Dogan
 PROJECT = Infinity
 URL = https://github.com/berkiyo/infinity
 */

import SwiftUI


/********************
 SplashScreenView
 */
struct SplashScreenView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    
    var body: some View {
        
        // Logic for loading the splashscreen
        if isActive {
            ListView()
        } else {
            VStack {
                VStack {
                    Image(systemName: "leaf.fill")
                        .font(.system(size: 80))
                        .foregroundColor(.green)
                    
                    Text("Infinity")
                        .font(.system(size: 26))
                    
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear { // This is the animation (fade in)
                    withAnimation(.easeIn(duration: 0.8)) {
                        self.size = 0.9
                        self.opacity = 1.0
                    } // Animation
                } // vstack
            } // outer vstack
            .onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation { // this perform's the splash screen with animation.
                        self.isActive = true
                    }
                }
            })
        }
    }
}
