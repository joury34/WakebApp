//
//  ReadingPage.swift
//  WakebApp
//
//  Created by Reuof on 11/12/2024.
//

import SwiftUI

struct ReadingPage: View {
    @State private var fontSize: Double = 14
    @State private var wordSpacing: Double = 1.5 // Default both word spacing and font size
    @State private var showSettings = false // Toggle for showing settings
    @State private var pageBackgroundColor: Color = Color("offwhite") // Default background color for the page (offwhite)
    @State private var selectedFont: String = "Arial" // Default font (Arial)

    var body: some View {
        NavigationView {
            ZStack {
                // Apply selected background color to the entire page
                pageBackgroundColor
                    .ignoresSafeArea()

                ScrollView { // Start of scrollable area
                    VStack(alignment: .leading, spacing: 10) { // Fixed line spacing
                        Text("Test text for scrolling:")
                            .font(.system(size: fontSize))
                            .padding()

                        ForEach(0..<20) { _ in
                            Text("Word word word word")                                 .font(.custom("Arial", size: fontSize))
                                .kerning(wordSpacing) // Apply word spacing using kerning
                                .padding([.leading, .trailing])
                        }
                    }
                    .padding()
                }
                .scrollIndicators(.visible) // Show scroll bar
                
                VStack {
                    Spacer()
                }
            }
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarItems(
                leading: Button(action: {
                    // Handle Back action (e.g., pop the navigation stack)
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("Back")
                    }
                    .foregroundColor(.black)
                },
                trailing: Button(action: {
                    showSettings.toggle() // Toggle settings visibility
                }) {
                    Text("Settings")
                        .foregroundColor(.black)
                    Image(systemName: "gearshape.fill")
                        .resizable()
                        .foregroundColor(.black)
                }
            )
            // iOS sheet implementation
            .sheet(isPresented: $showSettings) {
               
                SettingsSheetView(
                    fontSize: $fontSize,
                    wordSpacing: $wordSpacing,
                    pageBackgroundColor: $pageBackgroundColor // Now bind pageBackgroundColor
                )
                .presentationDetents([.height(350)]) // Limit the height of the sheet
                .presentationDragIndicator(.visible) // Show drag indicator
                .presentationBackground(.softy)
            }
        }
    }
}

struct SettingsSheetView: View {
    @Binding var fontSize: Double // Binding for font size
    @Binding var wordSpacing: Double // Binding for word spacing
    @Binding var pageBackgroundColor: Color // Binding for page background color

    var body: some View {
        VStack {
            // Font Size Slider
            VStack {
                Text("Font Size: \(Int(fontSize))")
                    .foregroundColor(Color.black)
                    .padding(.bottom, 10)
                Slider(value: $fontSize, in: 14...24, step: 1)
                    .padding([.leading, .trailing])
                    .accentColor(Color("Sage"))
            }

            // Word Spacing Slider
            VStack {
                Text("Word Spacing: \(String(format: "%.2f", wordSpacing))")
                    .foregroundColor(Color.black)
                    .padding(.bottom, 10)
                Slider(value: $wordSpacing, in: 0...8, step: 0.1)
                    .padding([.leading, .trailing])
                    .accentColor(Color("Sage"))
            }

            // Page Background Color Picker (Brown scale + Offwhite + New Color)
            VStack {
                Text("Background Color:")
                    .foregroundColor(Color.black)
                    .padding(.bottom, 10)

                // Stack for the color boxes
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))], spacing: 20) {
                    let backgroundColors: [Color] = [
                        Color("offwhite"),    // Default offwhite
                        Color("LightBrown"),   // Light brown
                        Color("yellowy"),      // Medium brown
                        Color("lightgray")     // Light gray
                    ]
                    let colorNames: [String] = [
                        "Origanl", "Calm", "Focus", "Paper"
                        
                    ]
                    
                    ForEach(0..<backgroundColors.count, id: \.self) { index in
                        RoundedRectangle(cornerRadius: 10)
                            .fill(backgroundColors[index])
                            .frame(height: 70)
                            .overlay(
                                VStack {
                                    Text(colorNames[index]) // Color name
                                        .font(.caption)
                                        .foregroundColor(Color.black)
                                        .padding(.top, 25)
                                    Spacer()
                                }
                            )
                            .padding(5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(pageBackgroundColor == backgroundColors[index] ? Color("Sage") : Color.gray, lineWidth: 2) // Border to indicate selection
                            )
                            .onTapGesture {
                                // Allow selecting the same color (even if it's already selected)
                                pageBackgroundColor = backgroundColors[index]
                            }
                    }
                }
                .padding([.leading, .trailing])
                
            }

        }
    }
}

struct ReadingPage_Previews: PreviewProvider {
    static var previews: some View {
        ReadingPage()
    }
}
