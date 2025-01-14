//
//  DocumentView.swift
//  WakebApp
//
//  Created by Reuof on 25/12/2024.
//



//import SwiftUI
//
//struct DocumentView: View {
//    var document: SavedDocument
//  
//    var body: some View {
//        ScrollView {
//            ZStack {
//                Color.offWhite
//                    .ignoresSafeArea()
//         
//                Text(document.content)
//                    .padding()
//                    .navigationTitle(document.title)
//                    .navigationBarTitleDisplayMode(.inline)
//            }
//        }
//    }
//}
import SwiftUI

struct DocumentView: View {
    var document: SavedDocument
    @State private var isEditing = false // State to control navigation

    var body: some View {
        NavigationView { // Wrap in NavigationView
            ScrollView {
                VStack(spacing: 20) {
                    Text(document.title)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                    
                    // Directly display the extracted text
                    Text(document.content) // Assuming 'content' holds the recognized text
                        .padding()
                        .background(Color.offWhite.opacity(0.1))
                        .cornerRadius(8)
                }
                .padding()
                .navigationTitle("Document Details")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(trailing: NavigationLink(destination: ReadingPage(extractedText: document.content)) {
                    Text("Edit") // Visible button label
                        .foregroundColor(.blue) // Change color if needed
                })
            }
        }
    }
}
