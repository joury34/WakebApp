//
//  DisplayTextView.swift
//  WakebApp
//
//  Created by Diala Abdulnasser Fayoumi on 16/06/1446 AH.
//
import SwiftUI

struct  DisplayTextView: View {
    var recognizedText: String

    var body: some View {
        VStack {
            Text(recognizedText)
                .padding()
                .navigationTitle("Recognized Text")
                .navigationBarTitleDisplayMode(.inline)

            Spacer()
        }
    }
}

