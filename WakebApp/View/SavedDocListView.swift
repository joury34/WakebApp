//
//  SavedDocListView.swift
//  WakebApp
//
//  Created by Reuof on 18/12/2024.
//


import SwiftUI

struct SavedDocListView: View {
    @StateObject private var viewModel = SavedDocumentViewModel()
    @State private var newDocumentContent = ""

    var body: some View {
        NavigationStack {
            ZStack {
                Color.offwhite
                    .ignoresSafeArea() // Background color for the entire view
                
                VStack {
                    // List to display saved documents
                    List {
                        ForEach(viewModel.documents) { document in
                            SavedDocumentRow(document: document, viewModel: viewModel)
                                .listRowInsets(EdgeInsets()) // Remove extra insets around each row
                        }
                        .onDelete(perform: delete)  // Swipe to delete
                    }
                    .listStyle(PlainListStyle())
                    .padding(.bottom, 10) // Add some bottom padding to separate the sections
                    
                    // Divider between the document list and the "Add Document" section (Optional)
                    Divider()
                        .background(Color.gray.opacity(0.5))
                        .padding(.horizontal)
                    
                    // Spacer to ensure the "Add Document" button stays at the bottom
                    Spacer()

                    // Text field to add a new document
                    VStack {
                        TextField("Document Content", text: $newDocumentContent)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding(.horizontal)
                            .frame(height: 40) // Adjust text field height for better usability
                        
                        Button("Add Document") {
                            if !newDocumentContent.isEmpty {
                                viewModel.addSavedDocument(content: newDocumentContent)
                                newDocumentContent = ""
                            }
                        }
                        .padding()
                        .background(.offwhitesheet) // Background color for the "Add Document" button
                        .foregroundColor(.black)
                        .cornerRadius(8)
                        .padding(.horizontal)
                        .padding(.bottom, 10)
                    }
                    .background(.offwhitesheet) // Rounded corner background for the "Add Document" section
                    .cornerRadius(12) // Rounded corners
                    .padding(.horizontal)
                    .shadow(radius: 5) // Optional: Add a shadow for visual depth
                }
                .navigationTitle("Saved Documents")
                       .navigationBarTitleDisplayMode(.inline)  // Adjust title display mode
                       .toolbar {
                           ToolbarItem(placement: .principal) {
                               Text("Saved Documents")
                                   .font(.system(size: 18, weight: .medium))  // Adjust font size here
                                   .foregroundColor(.black)  // Title color
                           }
                       }
                .navigationBarItems(leading: Button(action: {
                    // Action for Back button (if needed)
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("Back")
                    }
                    .foregroundColor(.black)
                })
                .padding(.top)
            }
        }
    }

    // Function to handle deletion of a document
    private func delete(at offsets: IndexSet) {
        for index in offsets {
            viewModel.removeSavedDocument(at: index)
        }
    }
}

// Custom row for each document in the list
struct SavedDocumentRow: View {
    @State private var documentName: String
    var document: SavedDocument
    var viewModel: SavedDocumentViewModel

    init(document: SavedDocument, viewModel: SavedDocumentViewModel) {
        self._documentName = State(initialValue: document.name)
        self.document = document
        self.viewModel = viewModel
    }

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                TextField("Document Name", text: $documentName)
                    .font(.headline)
                    .textFieldStyle(PlainTextFieldStyle()) // No background color for the text field
                    .frame(maxWidth: .infinity)
                    .padding(.bottom, 5)
                    .onChange(of: documentName) { newName in
                        // Rename document in the view model
                        if let index = viewModel.documents.firstIndex(where: { $0.id == document.id }) {
                            viewModel.renameDocument(at: index, newName: newName)
                        }
                    }
            }

            Text("Saved on: \(document.savedDate, formatter: dateFormatter)")
                .font(.subheadline)
                .foregroundColor(.gray)

            Text(document.content)
                .lineLimit(3)
                .foregroundColor(.black)
                .padding(.top, 5)
        }
        .padding()
        .background(.offwhitesheet)  // Background color for the document row changed to offwhite2
        .cornerRadius(8)  // Rounded corners for the document row
        .padding(.horizontal)  // This will make the box take the full width of the screen without extra padding
        .padding(.bottom, 5)   // Bottom padding for separation between rows
        .swipeActions {
            Button(role: .destructive) {
                // Delete action
                if let index = viewModel.documents.firstIndex(where: { $0.id == document.id }) {
                    viewModel.removeSavedDocument(at: index)
                }
            } label: {
                Label("Delete", systemImage: "trash")
            }
        }
    }
}

private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .short
    return formatter
}()

#Preview {
    SavedDocListView()
}
