//
//  SavedDocumentViewModel.swift
//  WakebApp
//
//  Created by Reuof on 18/12/2024.
//



//import SwiftUI
//
//class SavedDocumentViewModel: ObservableObject {
//    @Published var documents: [SavedDocument] = []
//
//    // Function to add a new saved document
//    func addSavedDocument(content: String) {
//        let newDocument = SavedDocument(
//            name: "Untitled Document",  // Default name
//            savedDate: Date(),
//            content: content
//        )
//        documents.insert(newDocument, at: 0)  // Insert at the beginning to maintain "first in, last out" order
//    }
//
//    // Function to remove a saved document
//    func removeSavedDocument(at index: Int) {
//        documents.remove(at: index)
//    }
//
//    // Function to rename a saved document
//    func renameDocument(at index: Int, newName: String) {
//        documents[index].name = newName
//    }
//}
  ///newwww
//import Foundation
//
//// The ViewModel to manage saved documents
//class SavedDocumentViewModel: ObservableObject {
//    @Published var documents: [SavedDocument] = []
//
//    // Function to add a new saved document
//    func addSavedDocument(content: String) {
//        let newDocument = SavedDocument(
//            name: "Untitled Document",  // Default name
//            savedDate: Date(),
//            content: content
//        )
//        documents.insert(newDocument, at: 0)  // Insert at the beginning to maintain "first in, last out" order
//    }
//
//    // Function to remove a saved document
//    func removeSavedDocument(at index: Int) {
//        documents.remove(at: index)
//    }
//
//    // Function to rename a saved document
//    func renameDocument(at index: Int, newName: String) {
//        documents[index].name = newName
//    }
//}

//last one
import Foundation
import SwiftUI

class SavedDocumentViewModel: ObservableObject {
    @Published var documents: [SavedDocument] = []

    // Add new saved document
    func addSavedDocument(content: String) {
        let newDocument = SavedDocument(
            name: "Untitled Document",  // Default name
            savedDate: Date(),
            content: content
        )
        documents.insert(newDocument, at: 0) // Insert at the beginning to maintain "first in, last out" order
    }

    // Remove a saved document
    func removeSavedDocument(at index: Int) {
        documents.remove(at: index)
    }

    // Rename a saved document
    func renameDocument(at index: Int, newName: String) {
        documents[index].name = newName
    }
}



