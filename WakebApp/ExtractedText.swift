//
//  ExtractedText.swift
//  WakebApp
//
//  Created by Diala Abdulnasser Fayoumi on 18/06/1446 AH.
//

import SwiftUI

struct  ExtractedText: View {
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
