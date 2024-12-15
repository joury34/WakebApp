//
//  ContentView.swift
//  WakebApp
//
//  Created by Maram Rabeh  on 10/06/1446 AH.
//

import SwiftUI

struct ContentView: View {
    @State private var navigateToHome = false// State to control navigation
    @State private var showSheet = false
    @State private var textSize: CGFloat = 14 // Default text size
    @State private var wordSpacing: CGFloat = 0 // Default word spacing
    var body: some View {
        
        NavigationStack {
            ZStack{
                
                Color.beigecolor
                 .ignoresSafeArea()
                
                
                
                VStack {
                   
                    Text("الآثار    في    مفهومها    التاريخي   ،  هي    بقايا    التاريخ    ومعالمه   ،  وهي    تشمل     العمارة    القديمة    وما    في   المتاحف    من    تماثيل    وتُحف   . أما   في    مفهومها    اللغوي    فهي    جمع   كلمة    «أَثَرٌ»    أي    «العلامة»    أو   الدلالة    على    شيئ    معين    أو   سبيل    محدد    والتخصص    الذي   يُعنى    بدراستها    هو    علم    الآثار   .")
                    
                        .font(.system(size: textSize))
                        .kerning(wordSpacing) // Adjust word spacing
                    
                    
                    
                    
                    
                    //go back to the home page
                        .navigationBarBackButtonHidden()  // Hide the default back button
                        .toolbar {
                            ToolbarItem(placement: .navigationBarLeading) {
                                Button(action: {
                                    navigateToHome = true  // Trigger navigation to HomePage
                                }) {
                                    HStack {
                                        Image(systemName: "chevron.left") // Back arrow
                                        Text("رجوع")  // Button text
                                    }
                                }
                                .foregroundColor(.black)
                            }
                        }
                        .navigationDestination(isPresented: $navigateToHome) {
                            HomePage()  // Navigate to HomePage when the flag is true
                        }
                    
                    //go back to the home page
                        .navigationBarBackButtonHidden()  // Hide the default back button
                        .toolbar {
                            ToolbarItem(placement: .navigationBarTrailing) {
                                Button(action: {
                                    showSheet.toggle() // show the sheet
                                }) {
                                    HStack {
                                        Text("الأعدادات")  // Button text
                                        Image(systemName: "gearshape.fill")
                                    }
                                }
                                .foregroundColor(.black)
                            }
                        }
                    
                    
                    
                        .sheet(isPresented:$showSheet, content:{
                            // Text("sheet 1")
                            VStack{
                                
                                //Spacer() //make the text go to the right
                                Text("عرض النص بعد التغييرات")
                                // .font(.title)
                                    .font(.system(size: textSize))
                                    .kerning(wordSpacing) // Adjust word spacing
                                    .padding()
                                    .frame(width: 380, height: 100) // Define size and alignment
                                    .background(
                                        Color.gray.opacity(0.3) // Background color for the rectangle
                                            .cornerRadius(10) // Rounded corners
                                        
                                    )
                                
                                Divider()
                                
                                
                                
                                
                                Text("حجم النص ")
                                Divider()
                                Slider(value: $textSize, in: 14...24, step: 1)
                                    .tint(Color.lightgreen)
                                    .frame(width:350)
                                    .rotationEffect(.degrees(180)) // Flip the slider direction
                                
                                Text("حجم النص: \(Int(textSize)) نقطة")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                
                                
                                Divider()
                                
                                
                                
                                
                                
                                Text("تباعد الكلمات")
                                
                                Divider()
                                
                                
                                Slider(value: $wordSpacing, in: 0...8, step: 0.1) // Slider to control word spacing
                                    .rotationEffect(.degrees(180)) // Flip the slider direction
                                    .tint(Color.lightgreen)
                                    .frame(width:350)
                                
                                Text("تباعد الكلمات: \(String(format: "%.1f", wordSpacing))")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                
                                
                                
                            }
                            .padding(.top,-270)
                            
                            .presentationDetents([.height(700)])
                            //  .interactiveDismissDisabled()
                            // Display gray bar at top
                            .presentationDragIndicator(.visible)
                        })
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                }
                
                
                .padding()
            }
                
            }
            
        }
        
    }


#Preview {
    ContentView()
}
