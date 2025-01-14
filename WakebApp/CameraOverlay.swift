//
//  CameraOverlay 2.swift
//  WakebApp
//
//  Created by Joury on 14/07/1446 AH.
//


import SwiftUI

struct CameraOverlay: View {
    var body: some View {
        ZStack {
            Color.clear
            // Draw the scanning area
            Rectangle()
                .stroke(Color.blue, lineWidth: 2)
                .frame(width: 300, height: 400) // Adjust size as needed
                .cornerRadius(10)
        }
    }
}
