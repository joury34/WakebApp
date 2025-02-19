//
//  PhotoPicker.swift
//  WakebApp
//
//  Created by Reuof on 22/12/2024.
//
//import SwiftUI
//import PhotosUI
//
//   struct PhotoPicker: UIViewControllerRepresentable {
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
import SwiftUI
import PhotosUI

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
