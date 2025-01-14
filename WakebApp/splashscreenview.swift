////
////  splashscreenview.swift
////  WakebApp
////
////  Created by Reuof on 19/12/2024.
////

//
//import SwiftUI
//
//struct splashscreenview: View {
//    @State private var isActive = false
//    @State private var size = 0.8
//    @State private var opacity = 0.5
//    @State private var navigateToOnboarding = false
//    @State private var navigateToHome = false
//    
//    var body: some View {
//        // Check if we should navigate to Onboarding or Home based on UserDefaults
//        if navigateToOnboarding {
//            BoardingPage()
//        } else if navigateToHome {
//            HomePage()
//        } else {
//            ZStack {
//                Color.offWhite
//                    .ignoresSafeArea()
//                
//                VStack {
//                    VStack {
//                        Image("logo1")
//                        Text("Grow With Every Word")
//                            .font(.custom("OpenDyslexic-Regular", size: 30))
//                            .padding(-50)
//                            .fontWeight(.bold)
//                            .multilineTextAlignment(.center)
//                    }
//                    .scaleEffect(size)
//                    .opacity(opacity)
//                    .onAppear {
//                        withAnimation(.easeIn(duration: 1.5)) {
//                            self.size = 0.9
//                            self.opacity = 1.0
//                        }
//                    }
//                }
//                .onAppear {
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//                        withAnimation {
//                            // Check if the user has already seen the onboarding
//                            if UserDefaults.standard.bool(forKey: "hasSeenOnboarding") {
//                                // If onboarding was shown, navigate to the HomePage
//                                self.navigateToHome = true
//                            } else {
//                                // If onboarding was not shown, navigate to the Onboarding view
//                                self.navigateToOnboarding = true
//                            }
//                        }
//                    }
//                }
//            }
//        }
//    }
//}
//
//#Preview {
//    splashscreenview()
//}

import SwiftUI

struct splashscreenview: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    @State private var navigateToOnboarding = false
    @State private var navigateToHome = false
    
    var body: some View {
        // Check if we should navigate to Onboarding or Home based on UserDefaults
        if navigateToOnboarding {
            BoardingPage()
        } else if navigateToHome {
            HomePage()
        } else {
            ZStack {
                Color.offWhite
                    .ignoresSafeArea()
                
                VStack {
                    VStack {
                        Image("logo1")
                        Text("Grow With Every Word")
                            .font(.custom("OpenDyslexic-Regular", size: 30))
                            .padding(-50)
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
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        withAnimation {
                            // Check if the user has already seen the onboarding
                            if UserDefaults.standard.bool(forKey: "hasSeenOnboarding") {
                                // If onboarding was shown, navigate to the HomePage
                                self.navigateToHome = true
                            } else {
                                // If onboarding was not shown, navigate to the Onboarding view
                                self.navigateToOnboarding = true
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    splashscreenview()
}
