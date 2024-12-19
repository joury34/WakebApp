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
    @State private var isAutoHighlightEnabled: Bool = false
    @State private var highlightColor: Color = Color("LightYellow")
    
    @State private var showSettings = false // Toggle for showing settings

    var body: some View {
        NavigationView {
            ZStack {
                Color.offwhite
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
                                .background(isAutoHighlightEnabled ? highlightColor.opacity(0.5) : Color.clear) // Auto highlight effect
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
                        //.frame(width: 27, height: 27)
                   
                        .foregroundColor(.black)
                }
            )
            // iOS sheet implementation
            .sheet(isPresented: $showSettings) {
               
                SettingsSheetView(
                    fontSize: $fontSize,
                    wordSpacing: $wordSpacing,
                    isAutoHighlightEnabled: $isAutoHighlightEnabled,
                    highlightColor: $highlightColor
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
    @Binding var isAutoHighlightEnabled: Bool // Binding for auto highlight toggle
    @Binding var highlightColor: Color // Binding for highlight color

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

            // Auto Highlight Toggle
            VStack {
                Toggle(isOn: $isAutoHighlightEnabled) {
                    Text("Enable Highlight")
                        .foregroundColor(Color.black)
                }
                .padding([.leading, .trailing])
                .accessibilityLabel("Auto highlight toggle")
                .accessibilityHint("Enable or disable auto highlight for text.")
            }

            // Highlight Color Picker
            VStack {
                Text("Highlight Color:")
                    .foregroundColor(Color.black)
                    .padding(.bottom, 10)
                
                HStack {
                    let highlightColors: [Color] = [
                        Color("LightYellow"), // Soft yellow
                        Color("SoftGreen"),   // Light green
                        Color("Peach"),       // Soft peach
                        Color("LightBlue")    // Soft blue
                    ]
                    
                    
                    ForEach(0..<highlightColors.count, id: \.self) { index in
                        Circle()
                            .fill(highlightColors[index])
                            .frame(width: 40, height: 40)
                            .overlay(
                                Circle().stroke(highlightColor == highlightColors[index] ? Color.sage : Color.gray, lineWidth: highlightColor == highlightColors[index] ? 3 : 1) // White border for selected, gray for others
                            )

                            .onTapGesture {
                                highlightColor = highlightColors[index] // Set the highlight color
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
