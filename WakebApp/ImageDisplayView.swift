import SwiftUI

struct ImageDisplayView: View {
    @Environment(\.presentationMode) var presentationMode
    let image: UIImage
    let recognizedText: String
    @Binding var selectedImage: UIImage? // Binding to the selected image in HomePage
    @Binding var isPickerPresented: Bool // Binding to control the photo picker presentation

    var body: some View {
        ZStack {
            Color.offWhite
                .ignoresSafeArea()
            VStack(spacing: 20) {
                // Image Display
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill) // Ensure the image fills the frame
                    .frame(width: 300, height: 300) // Set a fixed size
                    .clipShape(RoundedRectangle(cornerRadius: 20)) // Softer corners
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 4)
                    .padding()
                
                // Recognized Text Display
                
                
                
                // Buttons Section
                HStack(spacing: 15) {
                    // Confirm Photo Button
                    NavigationLink(destination: ReadingPage(extractedText: recognizedText)) {
                        Text("Confirm ")
                            .font(.headline)
                            .padding()
                            .foregroundColor(.black)
                            .background(Color.softy)
                            .cornerRadius(12)
                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                    }
                    
                    // Reselect Photo Button
                    Button(action: {
                        selectedImage = nil // Reset the selected image
                        isPickerPresented = true // Show the photo picker again
                    }) {
                        Text("Reselect  ")
                            .font(.headline)
                            .padding()
                            .foregroundColor(.black)
                            .background(Color.red)
                            .cornerRadius(12)
                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                    }
             
                    
                 
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .padding(.vertical)
            .navigationBarTitle("Review Photo", displayMode: .inline)
        }.navigationBarBackButtonHidden(true)
    }
}

// Preview
#Preview {
    ImageDisplayView(
        image: UIImage(systemName: "photo")!,
        recognizedText: "Sample Recognized Text",
        selectedImage: .constant(nil),
        isPickerPresented: .constant(false)
    )
}
