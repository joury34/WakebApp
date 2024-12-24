import Foundation
import Vision
import CoreData
import UIKit

class TextScannerViewModel: ObservableObject {
    @Published var recognizedText: String = ""
    public var capturedPhoto: UIImage?

    // Completion handler to notify when text extraction is done
    var onTextExtracted: (() -> Void)?

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
                    

                    // Notify that text extraction is complete
                    self.onTextExtracted?()
                }
            }
        }

        request.recognitionLevel = .accurate
        request.recognitionLanguages = ["ar-SA"]

        let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
        DispatchQueue.global(qos: .userInitiated).async {
            do {
                try handler.perform([request])
            } catch {
                print("Error performing text recognition: \(error.localizedDescription)")
            }
        }
    }

    func processCapturedImage(_ image: UIImage) {
        capturedPhoto = image
        extractText(from: image) // This should extract text and notify completion
    }

    func capturePhoto() {
        guard let image = self.capturedPhoto else {
            print("No photo captured")
            return
        }
        processCapturedImage(image)
    }
}
