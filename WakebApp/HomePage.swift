//
//  Untitled.swift
//  WakebApp
//
//  Created by Joury on 11/06/1446 AH.
//

//
//  voiceover.swift
//  WakebApp
//
//  Created by Joury on 14/06/1446 AH.
//
import SwiftUI
import AVFoundation

struct voiceover: View {
    @State private var synthesizer = AVSpeechSynthesizer()
    @State private var isSpeaking = false

    let text = "This is an example of spoken content in SwiftUI."
    let text2 = "هذه انا جوري الجميلة"
    var body: some View {
        VStack {
            Text(text)
                .padding()
                .font(.title)
                .multilineTextAlignment(.center)
            Text(text2)
                .padding()
                .font(.title)
                .multilineTextAlignment(.center)

            Button(action: {
                if isSpeaking {
                    synthesizer.stopSpeaking(at: .immediate)
                    isSpeaking = false
                } else {
                    let utterance = AVSpeechUtterance(string: text)
                    utterance.rate = 0.5
                    utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
                    synthesizer.speak(utterance)
                    isSpeaking = true
                }
            }) {
                Text(isSpeaking ? "Stop Speaking" : "Start Speaking")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(8)
            }
        }
        .padding()
    }
}





#Preview {
    voiceover()
}



