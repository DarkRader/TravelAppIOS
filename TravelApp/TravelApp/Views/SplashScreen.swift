//
//  SplashScreen.swift
//  TravelApp
//
//  Created by DarkRader on 22.08.2024.
//

import SwiftUI

struct SplashScreen: View {
    @State private var showAnim1: Bool = false
    @State private var showAnim2: Bool = false
    @State private var showAnim3: Bool = false
    
    var body: some View {
        ZStack {
            Rectangle()
//                .gradientFGLinear(colors: purpleLove, startP: .top, endP: .bottom)
                .fill(Color.purple.gradient)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                VStack(spacing: 0) {
                    Image(systemName: "globe.europe.africa.fill")
                        .font(.system(size: 50))
                        .foregroundStyle(.white)
                        .opacity(showAnim2 ? 0.6 : 0)
                    Text("Travel")
                        .font(.system(size: 35))
                        .foregroundStyle(.white.gradient)
                        .opacity(showAnim1 ? 1 : 0)
                    Text("Find Your Dream\nDestination With Us")
                        .font(.system(size: 15))
                        .foregroundStyle(.white.gradient)
                        .multilineTextAlignment(.center)
                        .opacity(showAnim3 ? 1 : 0)
                        .padding(.top, 15)
                }
                .onAppear(perform: {
                    withAnimation(.smooth(duration: 1).delay(0.5)) {
                        showAnim1.toggle()
                    }
                    withAnimation(.smooth(duration: 1.5).delay(1.5)) {
                        showAnim2.toggle()
                    }
                    withAnimation(.smooth(duration: 2.0).delay(2.5)) {
                        showAnim3.toggle()
                    }
                })
            }
        }
    }
}

#Preview {
    SplashScreen()
}
