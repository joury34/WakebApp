//
//  Untitled.swift
//  WakebApp
//
//  Created by Reuof on 24/12/2024.
//

import SwiftUI

struct LaunchView: View {
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false
//    @State private var hasSeenOnboarding = UserDefaults.standard.bool(forKey: "hasSeenOnboarding")

    var body: some View {
        if hasSeenOnboarding {
            HomePage()
        } else {
            BoardingPage()
                .onDisappear {
                    hasSeenOnboarding = true
                }
        }
    }
}


#Preview {
    LaunchView()
}
