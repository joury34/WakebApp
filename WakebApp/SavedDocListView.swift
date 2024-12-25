
//last
//import SwiftUI
//
//struct SavedDocListView: View {
//    @ObservedObject var viewModel: SavedDocumentViewModel  // Use @ObservedObject here
//    @State private var selectedDocument: SavedDocument?  // Track selected document
//    
//    var body: some View {
//        ZStack {
//            Color.offwhite
//                .ignoresSafeArea() // Background color for the entire view
//            VStack {
//                // List to display saved documents
//                List(viewModel.documents) { document in
//                 //   SavedDocumentRow(document: document, viewModel: viewModel)
//                        .onTapGesture {
//                            // When a document is tapped, set the selected document
//                            selectedDocument = document
//                        }
//                        .listRowInsets(EdgeInsets()) // Remove extra insets around each row
//                }
//                .listStyle(PlainListStyle())
//            }
//            .navigationTitle("Saved Documents")
//            .navigationBarTitleDisplayMode(.inline) // Set title to be small and in the middle
//            .navigationBarBackButtonHidden(true) // Hide default back button
//            .toolbar {
//                ToolbarItem(placement: .navigationBarLeading) {
//                    NavigationLink(destination: HomePage()) {
//                        HStack {
//                            Image(systemName: "chevron.left")
//                                .resizable()
//                                .frame(width: 20, height: 20)
//                            Text("Back")
//                        }
//                        .foregroundColor(.black)
//                    }
//                }
//            }
//            .navigationDestination(isPresented: .constant(selectedDocument != nil)) {
//                // Navigate to the ReadingPage to show the full content
//                if let selectedDocument = selectedDocument {
//                    ReadingPage(extractedText: selectedDocument.content)
//                }
//            }
//        }
//    }
//}

//struct SavedDocumentRow: View {
//    @State private var documentName: String
//    var document: SavedDocument
//    var viewModel: SavedDocumentViewModel
//
//    init(document: SavedDocument, viewModel: SavedDocumentViewModel) {
//        self._documentName = State(initialValue: document.name)
//        self.document = document
//        self.viewModel = viewModel
//    }
//
//    var body: some View {
//        VStack(alignment: .leading) {
//            HStack {
//                Spacer()  // Pushes the content to the far right
//                Image(systemName: "pencil")
//                    .foregroundColor(.gray)
//                    .padding(.trailing, 5)
//            }
//            
//            TextField("Document Name", text: $documentName)
//                .font(.headline)
//                .textFieldStyle(PlainTextFieldStyle()) // No background color for the text field
//                .frame(maxWidth: .infinity)
//                .padding(.bottom, 5)
//                .onChange(of: documentName) { newName in
//                    // Rename document in the view model
//                    if let index = viewModel.documents.firstIndex(where: { $0.id == document.id }) {
//                        viewModel.renameDocument(at: index, newName: newName)
//                    }
//                }
//
//            Text("Saved on: \(document.savedDate, formatter: dateFormatter)")
//                .font(.subheadline)
//                .foregroundColor(.gray)
//
//            // Show only the first 3 lines of the document content
//            Text(document.content)
//                .foregroundColor(.black)
//                .padding(.top, 5)
//                .lineLimit(3)  // Limit the text to 3 lines
//                .truncationMode(.tail) // Use truncation at the end if text overflows
//
//        }
//        .padding()
//        .background(Color.offwhitesheet)  // Background color for the document row
//        .cornerRadius(8)  // Rounded corners for the document row
//        .padding(.horizontal)  // This will make the box take the full width of the screen without extra padding
//        .padding(.bottom, 5)   // Bottom padding for separation between rows
//        .swipeActions {
//            Button(role: .destructive) {
//                // Delete action
//                if let index = viewModel.documents.firstIndex(where: { $0.id == document.id }) {
//                    viewModel.removeSavedDocument(at: index)
//                }
//            } label: {
//                Label("Delete", systemImage: "trash")
//            }
//        }
//    }
//}
//
//private let dateFormatter: DateFormatter = {
//    let formatter = DateFormatter()
//    formatter.dateStyle = .short
//    formatter.timeStyle = .short
//    return formatter
//}()
