//

//import SwiftUI
//
//struct ExtractedText: View {
//    var recognizedText: String
//    
//    var body: some View {
//        ZStack {
//            Color.offWhite
//                .ignoresSafeArea()
//            VStack {
//                Text(recognizedText)  // Display the extracted text
//                    .padding()
//                    .font(.body)
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                    .navigationTitle("Recognized Text")
//                    .navigationBarTitleDisplayMode(.inline)
//                
//                // Button to navigate to ReadingPage
//                
//                NavigationLink(destination: ReadingPage(extractedText: recognizedText)) {
//                    Text("Confirm")
//                        .font(.title2)
//                        .padding()
//                        .foregroundColor(.black)
//                        .background(Color.softy)
//                        .cornerRadius(10)
//                }  .navigationBarBackButtonHidden(true)
//                    .toolbar {
//                        ToolbarItem(placement: .navigationBarLeading) {
//                            NavigationLink(destination: HomePage()) {
//                                HStack {
//                                    Image(systemName: "chevron.left")
//                                        .resizable()
//                                        .frame(width: 24, height: 24)
//                                    Text("Back")
//                                        .font(.system(size: 24))
//                                    
//                                }
//                                .foregroundColor(.black)
//                                .padding()
//                            }
//                        }
//                    }
//                
//            }}
//        
//        
//    }}
import SwiftUI

struct ExtractedText: View {
    var recognizedText: String

    var body: some View {
        ZStack {
            Color.offWhite
                .ignoresSafeArea()
            VStack {
                Text(recognizedText)  // Display the extracted text
                    .padding()
                    .font(.body)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .navigationTitle("Recognized Text")
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarHidden(true)
                // Button to navigate to ReadingPage
                NavigationLink(destination: ReadingPage(extractedText: recognizedText)) {
                    Text("Confirm")
                        .font(.title2)
                        .padding()
                        .foregroundColor(.black)
                        .background(Color.softy)
                        .cornerRadius(10)
                }
                .padding()
            }
        }.navigationBarBackButtonHidden(true)
    }
      
}
