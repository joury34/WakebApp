//
//  splashscreenview.swift
//  WakebApp
//
//  Created by Reuof on 19/12/2024.
//


import SwiftUI

struct splashscreenview: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    var body: some View {
        if isActive {
            ReadingPage()
        } else {
            ZStack{
                Color.offWhite
                    .ignoresSafeArea()
            VStack{
                VStack{
                    Image("logo1")
                    Text("Grow With Every Word")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.5)) {
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                }
                }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3){
                    withAnimation{
                        self.isActive = true  }
                }
            }
            }
        }
      
    }
}

#Preview {
    splashscreenview()
}
