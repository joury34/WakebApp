//import Foundation
//import Vision
//import CoreData
//import UIKit
//
//class TextScannerViewModel: ObservableObject {
//    @Published var recognizedText: String = ""
//    public var capturedPhoto: UIImage?
//    @Published var savedDocuments: [SavedDocument] = []
//    // Completion handler to notify when text extraction is done
//    var onTextExtracted: (() -> Void)?
//
//    func saveRecognizedText(_ text: String) {
//        let context = PersistenceController.shared.container.viewContext
//        let textModel = TextModel(context: context)
//        textModel.recognizedText = text
//        do {
//            try context.save()
//            print("Text saved to Core Data")
//        } catch {
//            print("Failed to save text: \(error.localizedDescription)")
//        }
//    }
//
//    func extractText(from image: UIImage) {
//        guard let cgImage = image.cgImage else {
//            print("Could not convert UIImage to CGImage.")
//            return
//        }
//
//        let request = VNRecognizeTextRequest { (request, error) in
//            if let error = error {
//                print("Error recognizing text: \(error.localizedDescription)")
//                return
//            }
//
//            DispatchQueue.main.async {
//                if let results = request.results as? [VNRecognizedTextObservation] {
//                    self.recognizedText = results.compactMap { observation in
//                        observation.topCandidates(1).first?.string
//                    }.joined(separator: "\n")
//
//                    self.saveRecognizedText(self.recognizedText)
//                    
//
//                    // Notify that text extraction is complete
//                    self.onTextExtracted?()
//                }
//            }
//        }
//
//        request.recognitionLevel = .accurate
//        request.recognitionLanguages = ["ar-SA"]
//
//        let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
//        DispatchQueue.global(qos: .userInitiated).async {
//            do {
//                try handler.perform([request])
//            } catch {
//                print("Error performing text recognition: \(error.localizedDescription)")
//            }
//        }
//    }
//
//    func processCapturedImage(_ image: UIImage) {
//        capturedPhoto = image
//        extractText(from: image) // This should extract text and notify completion
//    }
//
//    func capturePhoto() {
//        guard let image = self.capturedPhoto else {
//            print("No photo captured")
//            return
//        }
//        processCapturedImage(image)
//    }
//    func saveDocument(title: String) {
//            let newDocument = SavedDocument(title: title, content: recognizedText, date: Date())
//            savedDocuments.append(newDocument)
//            // Optionally, save to file or persistent storage
//        }
//}
import Foundation
import Vision
import UIKit

class TextScannerViewModel: ObservableObject {
   @Published var recognizedText: String = ""
   public var capturedPhoto: UIImage?
   @Published var savedDocuments: [SavedDocument] = []
   
   // Completion handler to notify when text extraction is done
   var onTextExtracted: (() -> Void)?

   // Save recognized text to Core Data
   func saveRecognizedText(_ text: String) {
       let context = PersistenceController.shared.container.viewContext
       let textModel = TextModel(context: context)
       textModel.recognizedText = text
       do {
           try context.save()
           print("Text saved to Core Data")
       } catch {
           print("Failed to save text: \(error.localizedDescription)")
       }
   }
   
   // Extract text from the captured image
   func extractText(from image: UIImage) {
       guard let cgImage = image.cgImage else {
           print("Could not convert UIImage to CGImage.")
           return
       }
       
       let request = VNRecognizeTextRequest { (request, error) in
           if let error = error {
               print("Error recognizing text: \(error.localizedDescription)")
               return
           }
           
           DispatchQueue.main.async {
               if let results = request.results as? [VNRecognizedTextObservation] {
                   self.recognizedText = results.compactMap { observation in
                       observation.topCandidates(1).first?.string
                   }.joined(separator: "\n")
                   
                   self.saveRecognizedText(self.recognizedText)
                   self.saveDocument(title: "Extracted Document") // Automatically save the document here
                   
                   // Notify that text extraction is complete
                   self.onTextExtracted?() // Call the completion handler
               }
           }
       }
       
       request.recognitionLevel = .accurate
       request.recognitionLanguages = ["ar-SA"] // Modify based on your language needs
       
       let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
       DispatchQueue.global(qos: .userInitiated).async {
           do {
               try handler.perform([request])
           } catch {
               print("Error performing text recognition: \(error.localizedDescription)")
           }
       }
   }
   
   // Process the captured image and extract text
   func processCapturedImage(_ image: UIImage) {
       capturedPhoto = image
       extractText(from: image)
   }
   
   // Capture the photo and process it
   func capturePhoto() {
       guard let image = self.capturedPhoto else {
           print("No photo captured")
           return
       }
       processCapturedImage(image)
   }
   
   // Save the extracted document
   func saveDocument(title: String) {
       if !recognizedText.isEmpty {
           let newDocument = SavedDocument(title: title, content: recognizedText)
           savedDocuments.append(newDocument)
           DispatchQueue.main.async {
               self.objectWillChange.send()
           }
           print("Document saved: \(newDocument)") // Debugging output
       } else {
           print("Cannot save document: recognized text is empty.")
       }
   }
   
   // Resize the image
   func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
       let size = image.size
       
       let widthRatio  = targetSize.width  / size.width
       let heightRatio = targetSize.height / size.height
       
       // Determine the ratio to fit the image within the target size
       let ratio = min(widthRatio, heightRatio)
       
       // Calculate the new size
       let newSize = CGSize(width: size.width * ratio, height: size.height * ratio)
       
       // Resize the image
       UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
       image.draw(in: CGRect(origin: .zero, size: newSize))
       let newImage = UIGraphicsGetImageFromCurrentImageContext()
       UIGraphicsEndImageContext()
       
       return newImage ?? image
   }
   
   // Rename a saved document
   func renameDocument(id: UUID, newTitle: String) {
       if let index = savedDocuments.firstIndex(where: { $0.id == id }) {
           savedDocuments[index].title = newTitle
           print("Document renamed to: \(newTitle)") // Debugging output
       }
   }

   // Delete a saved document
   func deleteDocument(id: UUID) {
       savedDocuments.removeAll { $0.id == id }
       print("Document deleted") // Debugging output
   }
   
   // Get the documents directory
   private func getDocumentsDirectory() -> URL {
       // Get the documents directory for the app
       FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
   }
   
   // Save changes to a text file
   func saveChanges(newText: String) {
       recognizedText = newText
       let fileURL = getDocumentsDirectory().appendingPathComponent("savedDocument.txt")
       do {
           try newText.write(to: fileURL, atomically: true, encoding: .utf8)
       } catch {
           print("Error saving document: \(error)")
       }
   }
}

