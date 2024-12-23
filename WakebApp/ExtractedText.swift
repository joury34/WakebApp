//

import SwiftUI

struct ExtractedText: View {
    var recognizedText: String

    var body: some View {
        VStack {
            Text(recognizedText)  // Display the extracted text
                .padding()
                .font(.body)
                .frame(maxWidth: .infinity, alignment: .leading)
                .navigationTitle("Recognized Text")
                .navigationBarTitleDisplayMode(.inline)

            // Button to navigate to ReadingPage
            NavigationLink(destination: ReadingPage(extractedText: recognizedText)) {
                Text("confirm")
                    .font(.title2)
                    .padding()
                    .foregroundColor(.black)
                    .background(Color.softy)
                    .cornerRadius(10)
            }
            .padding()
        }
        
    }
      
}

