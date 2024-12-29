//
//  DocumentView.swift
//  WakebApp
//
//  Created by Reuof on 25/12/2024.
//



import SwiftUI

struct DocumentView: View {
    var document: SavedDocument
  
    var body: some View {
        ScrollView {
            ZStack {
                Color.offWhite
                    .ignoresSafeArea()
         
                Text(document.content)
                    .padding()
                    .navigationTitle(document.title)
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}
