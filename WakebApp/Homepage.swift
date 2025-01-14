//
////  HomePage.swift
////  WakebApp
////
////  Created by Maram Rabeh  on 17/12/2024.
////
//import SwiftUI
//import PhotosUI
//import AVFoundation
//
//struct HomePage: View {
//    @State private var isPickerPresented = false
//    @State private var selectedImage: UIImage? = nil
//    @StateObject private var viewModel = TextScannerViewModel()
//    @State private var isTextViewPresented = false
//    @State private var documentTitle: String = "Untitled Document" // Default title for saved documents
//    @State private var isSavedDocumentsPresented = false // State to control saved documents view
//    @State private var Player: AVAudioPlayer?
//
//   // var Player: AVAudioPlayer?
//
//    
//    var body: some View {
//        NavigationStack {
//            ZStack {
//                Color.offWhite
//                    .ignoresSafeArea()
//
//                VStack(spacing: 20) {
//                    Text("Select the scanning method")
//                        .font(.title)
//                        .fontWeight(.bold)
//                        .foregroundColor(.black)
//                        .padding(.bottom, 50)
//
//                    // Navigation link to CameraView
//                    NavigationLink(destination: CameraView(viewModel: viewModel, onCapturePhoto: {
//                        if !viewModel.recognizedText.isEmpty {
//                            isTextViewPresented = true
//                        }
//                    }), label: {
//                        HStack {
//                            Text("Take a photo")
//                                .font(.headline)
//                                .foregroundColor(.black)
//                            Image(systemName: "camera.fill")
//                                .foregroundColor(.black)
//                        }
//                        .frame(maxWidth: .infinity)
//                        .padding(50)
//                        .background(Color.softy)
//                        .cornerRadius(10)
//                        .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 5)
//                    })
//                    .simultaneousGesture(TapGesture().onEnded {
//                        playSound()
//                        print("FF")
//                    })
//                        
//
//                   
//                    // Button to upload from album
//                    Button(action: {
//                        isPickerPresented = true
//
//                    }) {
//                        HStack {
//                            Text("Upload from album")
//                                .font(.headline)
//                                .foregroundColor(.black)
//                            Image(systemName: "photo.fill")
//                                .foregroundColor(.black)
//                        }
//                        .frame(maxWidth: .infinity)
//                        .padding(50)
//                        .background(Color.softy)
//                        .cornerRadius(10)
//                        .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 5)
//                    }.simultaneousGesture(TapGesture().onEnded {
//                        playSound()
//                        print("FF")
//                    })
//                    .sheet(isPresented: $isPickerPresented) {
//                        PhotoPicker(selectedImage: $selectedImage)
//                            .onChange(of: selectedImage) { newImage in
//                                if let image = newImage {
//                                    viewModel.processCapturedImage(image)
//                                    print("Recognized Text: \(viewModel.recognizedText)") // Debugging output
//                                    if !viewModel.recognizedText.isEmpty {
//                                        isTextViewPresented = true
//                                    }
//                                }
//                            }
//                    }
//
//                    // Button to save the recognized text and navigate to saved documents
//                    Button(action: {
//                        viewModel.saveDocument(title: documentTitle)
//                        viewModel.recognizedText = "" // Optionally reset recognized text
//                        isSavedDocumentsPresented = true // Navigate to saved documents
//           
//                    }) {
//                        HStack {
//                            Text("Saved doucements")
//                                .font(.headline)
//                                .foregroundColor(.black)
//                            Image(systemName: "document.fill")
//                                .foregroundColor(.black)
//                        }
//                        .frame(maxWidth: .infinity)
//                        .padding(50)
//                        .background(Color.softy)
//                        .cornerRadius(10)
//                        .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 5)
//                    }.simultaneousGesture(TapGesture().onEnded {
//                        playSound()
//                        print("FF")
//                    })
//                    .sheet(isPresented: $isSavedDocumentsPresented) {
//                        SavedDocumentsView(viewModel: viewModel)
//                    }
//
//
//                    // Programmatic navigation to ExtractedText view if text is recognized
//                    NavigationLink(destination: ExtractedText(recognizedText: viewModel.recognizedText), isActive: $isTextViewPresented) {
//                        EmptyView()
//                    }
//                }
//                .padding()
//           
//            }
//        }.navigationBarBackButtonHidden(true)
//    }
//
//    struct PhotoPicker: UIViewControllerRepresentable {
//        @Binding var selectedImage: UIImage?
//
//        func makeUIViewController(context: Context) -> PHPickerViewController {
//            var configuration = PHPickerConfiguration()
//            configuration.filter = .images
//            configuration.selectionLimit = 1
//            let picker = PHPickerViewController(configuration: configuration)
//            picker.delegate = context.coordinator
//            return picker
//        }
//
//        func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {}
//
//        func makeCoordinator() -> Coordinator {
//            Coordinator(self)
//        }
//
//        class Coordinator: NSObject, PHPickerViewControllerDelegate {
//            let parent: PhotoPicker
//
//            init(_ parent: PhotoPicker) {
//                self.parent = parent
//            }
//
//            func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
//                picker.dismiss(animated: true)
//
//                guard let provider = results.first?.itemProvider else { return }
//                if provider.canLoadObject(ofClass: UIImage.self) {
//                    provider.loadObject(ofClass: UIImage.self) { image, error in
//                        DispatchQueue.main.async {
//                            self.parent.selectedImage = image as? UIImage
//                        }
//                    }
//                }
//            }
//        }
//    }
//    
//    func playSound() {
//                 guard let soundURL = Bundle.main.url(forResource: "buttonClick", withExtension: "mp3") else {
//                     return
//                 }
//                 do {
//                    Player = try AVAudioPlayer(contentsOf: soundURL)
//                    Player?.play()
//                 } catch {
//                     print("Error playing sound: \(error.localizedDescription)")
//                 }
//             }
//         
//}
//
//// View to display saved documents
//struct SavedDocumentsView: View {
//    @ObservedObject var viewModel: TextScannerViewModel
//
//    var body: some View {
//        NavigationView {
//            List(viewModel.savedDocuments) { document in
//                NavigationLink(destination: DocumentView(document: document)) {
//                    Text(document.title)
//                }
//            }
//            .navigationTitle("Saved Document")
//  
//        }
//    }
//}
//                                         
//#Preview {
//    HomePage()
//}
//                    
//import SwiftUI
//import AVFoundation
//
//struct HomePage: View {
//    @State private var navigateToImageDisplay = false
//    @State private var isPickerPresented = false
//    @State private var selectedImage: UIImage?
//    @StateObject private var viewModel = TextScannerViewModel()
//    @State private var isTextViewPresented = false
//    @State private var documentTitle: String = "Untitled Document"
//    @State private var isSavedDocumentsPresented = false
//    @State private var isLoading = false
//    @State private var Player: AVAudioPlayer?
//    var body: some View {
//        NavigationStack {
//            ZStack {
//                Color.offWhite
//                    .ignoresSafeArea()
//                
//                VStack(spacing: 12) {
//                    Text("Select the scanning method")
//                        .font(.title)
//                        .fontWeight(.bold)
//                        .foregroundColor(.black)
//                        .padding(.bottom, 50)
//                    
//                    // Navigation link to CameraView
//                    NavigationLink(destination: CameraView(viewModel: viewModel, onCapturePhoto: {
//                        if !viewModel.recognizedText.isEmpty {
//                            isTextViewPresented = true
//                        }
//                    }), label: {
//                        HStack {
//                            Text("Take a photo")
//                                .font(.headline)
//                                .foregroundColor(.black)
//                            Image(systemName: "camera.fill")
//                                .foregroundColor(.black)
//                        }
//                        .frame(maxWidth: .infinity)
//                        .padding(50)
//                        .background(Color.softy)
//                        .cornerRadius(10)
//                        .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 5)
//                    })
//                    .simultaneousGesture(TapGesture().onEnded {
//                        playSound()
//                        print("FF")
//                    })
//                    
//                    
//                    
//                    // Button to upload from album
//                    Button(action: {
//                        isPickerPresented = true // Trigger the photo picker
//                    }) {
//                        HStack {
//                            Text("Upload from album")
//                                .font(.headline)
//                                .foregroundColor(.black)
//                            Image(systemName: "photo.fill")
//                                .foregroundColor(.black)
//                        }
//                        .frame(maxWidth: .infinity)
//                        .padding(50)
//                        .background(Color.softy)
//                        .cornerRadius(10)
//                        .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 5)
//                    }.simultaneousGesture(TapGesture().onEnded {
//                        playSound()
//                        print("FF")
//                    })
//                    .sheet(isPresented: $isPickerPresented) {
//                        PhotoPicker(selectedImage: $selectedImage)
//                            .onChange(of: selectedImage) { newImage in
//                                if let image = newImage {
//                                    viewModel.processCapturedImage(image)
//                                    print("Recognized Text: \(viewModel.recognizedText)") // Debugging output
//                                    
//                                    // Set navigation state immediately after image selection
//                                    navigateToImageDisplay = true
//                                }
//                            }
//                    }
                    
//                    // Programmatic navigation to ImageDisplayView if an image is selected
//                    NavigationLink(
//                        destination: ImageDisplayView(image: selectedImage ?? UIImage(), recognizedText: viewModel.recognizedText, selectedImage: $selectedImage, isPickerPresented: $isPickerPresented),
//                        isActive: $navigateToImageDisplay
//                    ) {
//                        EmptyView()
//                    }
//
//                    Button(action: {
//                        isLoading = true // Set loading state to true
//                        viewModel.saveDocument(title: documentTitle) // Save the document
//                        isSavedDocumentsPresented = true // Navigate to saved documents view
//                        isLoading = false // Set loading state to false after saving
//                    }) {
//                        if isLoading {
//                            ProgressView() // Show loading indicator
//                                .progressViewStyle(CircularProgressViewStyle())
//                        } else {
//                            HStack {
//                                Text("Save Document")
//                                    .font(.headline)
//                                    .foregroundColor(.black)
//                                Image(systemName: "document.fill")
//                                    .foregroundColor(.black)
//                            }
//                            .frame(maxWidth: .infinity)
//                            .padding(50)
//                            .background(Color.softy)
//                            .cornerRadius(10)
//                            .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 5)
//
//                        }
//
//
//
//
//                    }
//
//
//                }
//
//                .navigationDestination(isPresented: $isSavedDocumentsPresented) {
//                    SavedDocumentsView(viewModel: viewModel)
//                }
//
//                .padding()
//
//            }
//        }.navigationBarBackButtonHidden(true)
                    // Programmatic navigation to ImageDisplayView if an image is selected
//                                        NavigationLink(
//                                            destination: ImageDisplayView(image: selectedImage ?? UIImage(), recognizedText: viewModel.recognizedText, selectedImage: $selectedImage, isPickerPresented: $isPickerPresented),
//                                            isActive: $navigateToImageDisplay
//                                        ) {
//                                            EmptyView()
//                                        }
//                                        
//                                        Button(action: {
//                                            isLoading = true // Set loading state to true
//                                         
//                                            isSavedDocumentsPresented = true // Navigate to saved documents view
//                                            isLoading = false // Set loading state to false after saving
//                                        }) {
//                                          
//                                                HStack {
//                                                    Text("Save Document")
//                                                        .font(.headline)
//                                                        .foregroundColor(.black)
//                                                    Image(systemName: "document.fill")
//                                                        .foregroundColor(.black)
//                                                }
//                                                .frame(maxWidth: .infinity)
//                                                .padding(50)
//                                                .background(Color.softy)
//                                                .cornerRadius(10)
//                                                .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 5)
//                                            
//                                            
//                                              
//                                              
//                                            
//                                            
//                                        }
//                                        
//                                       
//                                    }
//                                   
//                                    .navigationDestination(isPresented: $isSavedDocumentsPresented) {
//                                        SavedDocumentsView(viewModel: viewModel)
//                                    }
//                                    
//                                    .padding()
//                                    
//                                }
//                            }.navigationBarBackButtonHidden(true)
//                            
//        
//                          }
//    func playSound() {
//                   guard let soundURL = Bundle.main.url(forResource: "buttonClick", withExtension: "mp3") else {
//                       return
//                   }
//                   do {
//                      Player = try AVAudioPlayer(contentsOf: soundURL)
//                      Player?.play()
//                   } catch {
//                       print("Error playing sound: \(error.localizedDescription)")
//                   }
//               }
//           
//  }
//                      
//                  
//
//#Preview {
//    HomePage()
//}
//
//
//import SwiftUI
//
//struct ImageDisplayView: View {
//    @Environment(\.presentationMode) var presentationMode
//    let image: UIImage
//    let recognizedText: String
//    @Binding var selectedImage: UIImage? // Binding to the selected image in HomePage
//    @Binding var isPickerPresented: Bool // Binding to control the photo picker presentation
//
//    var body: some View {
//        ZStack {
//            Color.offWhite
//                .ignoresSafeArea()
//            VStack(spacing: 20) {
//                // Image Display
//                Image(uiImage: image)
//                    .resizable()
//                    .aspectRatio(contentMode: .fill) // Ensure the image fills the frame
//                    .frame(width: 300, height: 300) // Set a fixed size
//                    .clipShape(RoundedRectangle(cornerRadius: 20)) // Softer corners
//                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 4)
//                    .padding()
//                
//                // Recognized Text Display
//                
//                
//                
//                // Buttons Section
//                HStack(spacing: 15) {
//                    // Confirm Photo Button
//                    NavigationLink(destination: ReadingPage(extractedText: recognizedText)) {
//                        Text("Confirm ")
//                            .font(.headline)
//                            .padding()
//                            .foregroundColor(.black)
//                            .background(Color.softy)
//                            .cornerRadius(12)
//                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
//                    }
//                    
//                    // Reselect Photo Button
//                    Button(action: {
//                        selectedImage = nil // Reset the selected image
//                        isPickerPresented = true // Show the photo picker again
//                    }) {
//                        Text("Reselect  ")
//                            .font(.headline)
//                            .padding()
//                            .foregroundColor(.black)
//                            .background(Color.red)
//                            .cornerRadius(12)
//                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
//                    }
//             
//                    
//                 
//                }
//                .padding(.horizontal)
//                
//                Spacer()
//            }
//            .padding(.vertical)
//            .navigationBarTitle("Review Photo", displayMode: .inline)
//        }.navigationBarBackButtonHidden(true)
//    }
//}
//
//// Preview
//#Preview {
//    ImageDisplayView(
//        image: UIImage(systemName: "photo")!,
//        recognizedText: "Sample Recognized Text",
//        selectedImage: .constant(nil),
//        isPickerPresented: .constant(false)
//    )
//}
import SwiftUI
import AVFoundation

struct HomePage: View {
    @State private var navigateToImageDisplay = false
    @State private var isPickerPresented = false
    @State private var selectedImage: UIImage?
    @StateObject private var viewModel = TextScannerViewModel()
    @State private var isTextViewPresented = false
    @State private var documentTitle: String = "Untitled Document"
    @State private var isSavedDocumentsPresented = false
    @State private var isLoading = false
    @State private var Player: AVAudioPlayer?
    var body: some View {
        NavigationStack {
            ZStack {
                Color.offWhite
                    .ignoresSafeArea()
                
                VStack(spacing: 12) {
                    Text("Select the scanning method")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(.bottom, 50)
                    
                    // Navigation link to CameraView
                    NavigationLink(destination: CameraView(viewModel: viewModel, onCapturePhoto: {
                        if !viewModel.recognizedText.isEmpty {
                            isTextViewPresented = true
                        }
                    }), label: {
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
                    })
                    .simultaneousGesture(TapGesture().onEnded {
                        playSound()
                        print("FF")
                    })
                    
                    
                    
                    // Button to upload from album
                    Button(action: {
                        isPickerPresented = true // Trigger the photo picker
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
                    }.simultaneousGesture(TapGesture().onEnded {
                        playSound()
                        print("FF")
                    })
                    .sheet(isPresented: $isPickerPresented) {
                        PhotoPicker(selectedImage: $selectedImage)
                            .onChange(of: selectedImage) { newImage in
                                if let image = newImage {
                                    viewModel.processCapturedImage(image)
                                    print("Recognized Text: \(viewModel.recognizedText)") // Debugging output
                                    
                                    // Set navigation state immediately after image selection
                                    navigateToImageDisplay = true
                                }
                            }
                    }
                    
//                    // Programmatic navigation to ImageDisplayView if an image is selected
//                    NavigationLink(
//                        destination: ImageDisplayView(image: selectedImage ?? UIImage(), recognizedText: viewModel.recognizedText, selectedImage: $selectedImage, isPickerPresented: $isPickerPresented),
//                        isActive: $navigateToImageDisplay
//                    ) {
//                        EmptyView()
//                    }
//
//                    Button(action: {
//                        isLoading = true // Set loading state to true
//                        viewModel.saveDocument(title: documentTitle) // Save the document
//                        isSavedDocumentsPresented = true // Navigate to saved documents view
//                        isLoading = false // Set loading state to false after saving
//                    }) {
//                        if isLoading {
//                            ProgressView() // Show loading indicator
//                                .progressViewStyle(CircularProgressViewStyle())
//                        } else {
//                            HStack {
//                                Text("Save Document")
//                                    .font(.headline)
//                                    .foregroundColor(.black)
//                                Image(systemName: "document.fill")
//                                    .foregroundColor(.black)
//                            }
//                            .frame(maxWidth: .infinity)
//                            .padding(50)
//                            .background(Color.softy)
//                            .cornerRadius(10)
//                            .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 5)
//
//                        }
//
//
//
//
//                    }
//
//
//                }
//
//                .navigationDestination(isPresented: $isSavedDocumentsPresented) {
//                    SavedDocumentsView(viewModel: viewModel)
//                }
//
//                .padding()
//
//            }
//        }.navigationBarBackButtonHidden(true)
                    // Programmatic navigation to ImageDisplayView if an image is selected
                                        NavigationLink(
                                            destination: ImageDisplayView(image: selectedImage ?? UIImage(), recognizedText: viewModel.recognizedText, selectedImage: $selectedImage, isPickerPresented: $isPickerPresented),
                                            isActive: $navigateToImageDisplay
                                        ) {
                                            EmptyView()
                                        }
                                        
                                        Button(action: {
                                            isLoading = true // Set loading state to true
                                         
                                            isSavedDocumentsPresented = true // Navigate to saved documents view
                                            isLoading = false // Set loading state to false after saving
                                        }) {
                                          
                                                HStack {
                                                    Text("Save Document")
                                                        .font(.headline)
                                                        .foregroundColor(.black)
                                                    Image(systemName: "document.fill")
                                                        .foregroundColor(.black)
                                                }
                                                .frame(maxWidth: .infinity)
                                                .padding(50)
                                                .background(Color.softy)
                                                .cornerRadius(10)
                                                .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 5)
                                            
                                            
                                              
                                              
                                            
                                            
                                        }
                                        
                                       
                                    }
                                   
                                    .navigationDestination(isPresented: $isSavedDocumentsPresented) {
                                        SavedDocumentsView(viewModel: viewModel)
                                    }
                                    
                                    .padding()
                                    
                                }
                            }.navigationBarBackButtonHidden(true)
                            
        
                          }
    func playSound() {
                   guard let soundURL = Bundle.main.url(forResource: "buttonClick", withExtension: "mp3") else {
                       return
                   }
                   do {
                      Player = try AVAudioPlayer(contentsOf: soundURL)
                      Player?.play()
                   } catch {
                       print("Error playing sound: \(error.localizedDescription)")
                   }
               }
           
  }
                      
                  

#Preview {
    HomePage()
}


