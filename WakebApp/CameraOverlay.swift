//
//  CameraOverlay.swift
//  WakebApp
//
//  Created by Diala Abdulnasser Fayoumi on 17/06/1446 AH.
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
