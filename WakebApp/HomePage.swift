//
//  HomePage.swift
//  WakebApp
//
//  Created by Maram Rabeh  on 17/12/2024.
//

import SwiftUI

struct HomePage: View {
    var body: some View {
        ZStack {
            Color.offWhite // Set the background color for the entire screen
                .ignoresSafeArea() // Ensures the color fills the entire screen
            
            VStack(spacing: 20) {
                Text("Select the scanning method")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding(.bottom, 50)
                
                Button(action: {
                    print("Take Photo tapped")
                }) {
                    HStack {
                    
                        Text("Take a photo")
                            .font(.headline)
                            .foregroundColor(.black)
                        Image(systemName: "camera.fill")
                            .foregroundColor(.black)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(50)
                    .background(Color.lightGreen)
                    .cornerRadius(10)
                    .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 5)
                }
                
                Button(action: {
                    print("Upload from Album tapped")
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
                    .background(Color.lightGreen) // Button background color remains white
                    .cornerRadius(10)
                    .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 5)
                }
                
                Button(action: {
                    print("Saved Documents tapped")
                }) {
                    HStack {
                        Text("Saved Documents")
                            .font(.headline)
                            .foregroundColor(.black)
                        Image(systemName: "doc.fill")
                            .foregroundColor(.black)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(50)
                    .background(Color.lightGreen) // Button background color remains white
                    .cornerRadius(10)
                    .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 5)
                }
            }
            .padding()
        }
    }
}

#Preview {
    HomePage()
}
