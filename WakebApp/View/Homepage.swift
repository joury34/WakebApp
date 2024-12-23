
//  HomePage.swift
//  WakebApp
//
//  Created by Maram Rabeh  on 17/12/2024.
//
import SwiftUI
import PhotosUI

struct HomePage: View {
    @State private var isPickerPresented = false
    @State private var selectedImage: UIImage? = nil
    @StateObject private var viewModel = TextScannerViewModel()
    @State private var isTextViewPresented = false
    @State private var isSaveDocumentPresented  = false

    var body: some View {
        NavigationStack {
            ZStack {
                Color.offwhite
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    Text("Select the scanning method")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(.bottom, 50)

                    // Button to take a photo
                    NavigationLink(destination: CameraView(viewModel: viewModel)
                        {
                            // Check if text was extracted and navigate if necessary
                            if !viewModel.recognizedText.isEmpty {
                                isTextViewPresented = true
                            }
                        }) {
                        HStack {
                            Text("Take a photo")
                                .font(.headline)
                                .foregroundColor(.black)
                            Image(systemName: "camera.fill")
                                .foregroundColor(.black)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(50)
                        .background(Color.softy)
                        .cornerRadius(10)
                        .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 5)
                    }

                    // Button to upload from album
                    Button(action: {
                        isPickerPresented = true
                    }) {
                        HStack {
                            Text("Upload from album")
                                .font(.headline)
                                .foregroundColor(.black)
                            Image(systemName: "photo.fill")
                                .foregroundColor(.black)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(50)
                        .background(Color.softy)
                        .cornerRadius(10)
                        .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 5)
                    }
                    .sheet(isPresented: $isPickerPresented) {
                        PhotoPicker(selectedImage: $selectedImage)
                            .onChange(of: selectedImage) { newImage in
                                if let image = newImage {
                                    viewModel.processCapturedImage(image)
                                    viewModel.onTextExtracted = {
                                        isTextViewPresented = true // Navigate to text view after processing
                                    }
                                }
                            }
                    }

                    // Button for saved documents (placeholder for future implementation)
                    Button(action: {
                        // Action for saved documents can be added here
                        isSaveDocumentPresented=true
                    }) {
                        HStack {
                            Text("Saved Documents")
                                .font(.headline)
                                .foregroundColor(.black)
                            Image(systemName: "doc.fill")
                                .foregroundColor(.black)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(50)
                        .background(Color.softy)
                        .cornerRadius(10)
                        .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 5)
                    }
                    NavigationLink(destination:SavedDocListView(), isActive: $isSaveDocumentPresented){
                                    EmptyView()
                                }
                    

                    // Navigate to ExtractedText view if text is recognized
                    NavigationLink(destination: ExtractedText(recognizedText: viewModel.recognizedText), isActive: $isTextViewPresented) {
                        EmptyView() // This NavigationLink is used for programmatic navigation
                    }
                }
                .padding()
               // .navigationBarBackButtonHidden(true)
            }
          
        }
         .navigationBarBackButtonHidden(true)
    }
    

}

#Preview {
    HomePage()
}
