//
//  SavedDoc.swift
//  WakebApp
//
//  Created by Joury on 15/06/1446 AH.
//
import SwiftUI


struct SavedDoc: View {
    @State private var navigateToHome = false// State to control navigation
    
    var body: some View {
        NavigationStack {
            VStack{
                Rectangle()
                               .fill(Color.beigecolor)
                               .frame(width: 326, height:221)
                               .cornerRadius(10)
                
                               .padding()
       


                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            navigateToHome = true  // Trigger navigation to HomePage
                        }) {
                            HStack {
                                Image(systemName: "chevron.left") // Back arrow
                                Text("Back") // Button text
                            }
                        }
                        .foregroundColor(.black)
                    }
                }
                .navigationDestination(isPresented: $navigateToHome) {
                    voiceover()  // Navigate to HomePage when the flag is true
                }
                
                
                //go back to the home page
                    .navigationBarBackButtonHidden()  // Hide the default back button
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button(action: {
                              
                            }) {
                                HStack {
                                    Text("Saved Documents")  // Button text
                                    Image(systemName: "document")
                                 
                                }
                            }
                            .foregroundColor(.black)
                        }
                    }
                
            }
          
        }
    }
        
}

#Preview {
    SavedDoc()
}



