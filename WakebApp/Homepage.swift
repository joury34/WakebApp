
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

    var body: some View {
        NavigationStack {
            ZStack {
                Color.offWhite
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    Text("Select the scanning method")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(.bottom, 50)

                    // Button to take a photo
                    NavigationLink(destination: CameraView(viewModel: viewModel)
                        .onDisappear {
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
                        .background(Color.lightGreen)
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
                        .background(Color.lightGreen)
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
                        .background(Color.lightGreen)
                        .cornerRadius(10)
                        .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 5)
                    }

                    // Navigate to ExtractedText view if text is recognized
                    NavigationLink(destination: ExtractedText(recognizedText: viewModel.recognizedText), isActive: $isTextViewPresented) {
                        EmptyView() // This NavigationLink is used for programmatic navigation
                    }
                }
                .padding()
                .navigationBarBackButtonHidden(true)
            }
        }
    }
    
    struct PhotoPicker: UIViewControllerRepresentable {
        @Binding var selectedImage: UIImage?

        func makeUIViewController(context: Context) -> PHPickerViewController {
            var configuration = PHPickerConfiguration()
            configuration.filter = .images
            configuration.selectionLimit = 1
            let picker = PHPickerViewController(configuration: configuration)
            picker.delegate = context.coordinator
            return picker
        }

        func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {}

        func makeCoordinator() -> Coordinator {
            Coordinator(self)
        }

        class Coordinator: NSObject, PHPickerViewControllerDelegate {
            let parent: PhotoPicker

            init(_ parent: PhotoPicker) {
                self.parent = parent
            }

            func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
                picker.dismiss(animated: true)

                guard let provider = results.first?.itemProvider else { return }
                if provider.canLoadObject(ofClass: UIImage.self) {
                    provider.loadObject(ofClass: UIImage.self) { image, error in
                        DispatchQueue.main.async {
                            self.parent.selectedImage = image as? UIImage
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    HomePage()
}
