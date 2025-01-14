//
//  SavedDocumentsView.swift
//  WakebApp
//
//  Created by Joury on 14/07/1446 AH.
//


import SwiftUI

struct SavedDocumentsView: View {
    @ObservedObject var viewModel: TextScannerViewModel
    @State private var showRenameSheet = false
    @State private var documentToRename: SavedDocument?
    @State private var newDocumentTitle: String = ""

    var body: some View {
        NavigationView {
            ZStack {
                // Background color for the entire view
                Color.offWhite
                    .ignoresSafeArea()

                // List with a transparent background to show the ZStack's color
                List {
                    ForEach(viewModel.savedDocuments) { document in
                        HStack {
                            NavigationLink(destination: DocumentDetailView(extractedText: document.content)) {
                                Text(document.title) // Display the document title
                            }
                            Spacer()
                            // Rename Button
                            Button(action: {
                                documentToRename = document
                                newDocumentTitle = document.title // Pre-fill the text field
                                showRenameSheet = true
                            }) {
                                Image(systemName: "pencil")
                                    .foregroundColor(.blue)
                            }
                            .buttonStyle(BorderlessButtonStyle())

                            // Delete Button
                            Button(action: {
                                viewModel.deleteDocument(id: document.id)
                            }) {
                                Image(systemName: "trash")
                                    .foregroundColor(.red)
                            }
                            .buttonStyle(BorderlessButtonStyle())
                        }
                    }
                }
                .scrollContentBackground(.hidden) // Makes the List's background transparent
                .navigationTitle("Saved Documents")
                .sheet(isPresented: $showRenameSheet) {
                    RenameDocumentView(
                        document: $documentToRename,
                        newTitle: $newDocumentTitle,
                        onRename: {
                            if let document = documentToRename {
                                viewModel.renameDocument(id: document.id, newTitle: newDocumentTitle)
                            }
                            showRenameSheet = false
                        }
                    )
                    .background(Color.offwhitesheet) // Background color for the sheet
                    .ignoresSafeArea() // Ensures the background color fills the sheet
                }
            }
        }
    }
}
