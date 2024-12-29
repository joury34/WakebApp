//
//  ReadingPage.swift
//  WakebApp
//
//  Created by Reuof on 11/12/2024.
//
//import SwiftUI


//struct ReadingPage: View {
//    @State private var fontSize: Double = 14
//    @State private var wordSpacing: Double = 1.5 // Default both word spacing and font size
//    @State private var showSettings = false // Toggle for showing settings
//    @State private var pageBackgroundColor: Color = Color("offwhite") // Default background color for the page (offwhite)
//    @State private var selectedFont: String = "Arial" // Default font (use PostScript name)
//    
//    var extractedText: String  // Text passed from ExtractedText
//
//    var body: some View {
//        NavigationView {
//            ZStack {
//                // Apply selected background color to the entire page
//                pageBackgroundColor
//                    .ignoresSafeArea()
//
//                ScrollView { // Start of scrollable area
//                    VStack(alignment: .leading, spacing: 10) { // Fixed line spacing
//                        Text(extractedText)  // Display the extracted text
//                            .font(.custom(selectedFont, size: fontSize)) // Use selected font
//                            .kerning(wordSpacing) // Apply word spacing using kerning
//                            .padding([.leading, .trailing])
//                    }
//                    .padding()
//                }
//                .scrollIndicators(.visible) // Show scroll bar
//            }
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
//                
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    Button(action: {
//                        showSettings.toggle() // Toggle settings visibility
//                    }) {
//                        Text("Settings")
//                            .foregroundColor(.black)
//                        Image(systemName: "gearshape.fill")
//                            .resizable()
//                            .foregroundColor(.black)
//                    }
//                }
//                
//            }
//        }
//        // iOS sheet implementation for settings
//        .sheet(isPresented: $showSettings) {
//            SettingsSheetView(
//                fontSize: $fontSize,
//                wordSpacing: $wordSpacing,
//                pageBackgroundColor: $pageBackgroundColor, // Now bind pageBackgroundColor
//                selectedFont: $selectedFont // Bind selectedFont to the sheet
//            )
//            .presentationDetents([.height(400)]) // Limit the height of the sheet
//            .presentationDragIndicator(.visible) // Show drag indicator
//            .presentationBackground(.softy)
//        }
//        .navigationBarBackButtonHidden(true)
//    }
//       // .navigationBarBackButtonHidden(true)
//}
import SwiftUI

//struct ReadingPage: View {
//    @State private var fontSize: Double = 14
//    @State private var wordSpacing: Double = 1.5 // Default both word spacing and font size
//    @State private var showSettings = false // Toggle for showing settings
//    @State private var pageBackgroundColor: Color = Color("offwhite") // Default background color for the page (offwhite)
//    @State private var selectedFont: String = "Arial" // Default font (use PostScript name)
//    
//    @StateObject private var savedDocumentViewModel = SavedDocumentViewModel() // ViewModel for saved docs
//    @State private var navigateToSavedView = false // State to trigger navigation
//    
//    var extractedText: String  // Text passed from ExtractedText
//
//    var body: some View {
//        NavigationView {
//            ZStack {
//                // Apply selected background color to the entire page
//                pageBackgroundColor
//                    .ignoresSafeArea()
//
//                ScrollView { // Start of scrollable area
//                    VStack(alignment: .leading, spacing: 10) { // Fixed line spacing
//                        Text(extractedText)  // Display the extracted text
//                            .font(.custom(selectedFont, size: fontSize)) // Use selected font
//                            .kerning(wordSpacing) // Apply word spacing using kerning
//                            .padding([.leading, .trailing])
//                    }
//                    .padding()
//                }
//                .scrollIndicators(.visible) // Show scroll bar
//                
//                // Save button at the bottom-right
//                VStack {
//                    Spacer()
//                    HStack {
//                        Spacer()
//                        Button(action: saveDocument) {
//                            Image(systemName: "doc.fill")
//                                .resizable()
//                                .frame(width: 30, height: 30)
//                                .padding()
//                                .background(Color.white.opacity(0.7))
//                                .foregroundColor(.black)
//                                .clipShape(Circle())
//                                .shadow(radius: 5)
//                        }
//                        .padding(.bottom, 30)
//                        .padding(.trailing, 15)
//                    }
//                }
//                
//                // NavigationLink to trigger navigation to SavedDocListView
//                NavigationLink(destination: SavedDocListView(), isActive: $navigateToSavedView) {
//                    EmptyView()
//                }
//            }
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
//                
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    Button(action: {
//                        showSettings.toggle() // Toggle settings visibility
//                    }) {
//                        Text("Settings")
//                            .foregroundColor(.black)
//                        Image(systemName: "gearshape.fill")
//                            .resizable()
//                            .foregroundColor(.black)
//                    }
//                }
//            }
//        }
//        .sheet(isPresented: $showSettings) {
//            SettingsSheetView(
//                fontSize: $fontSize,
//                wordSpacing: $wordSpacing,
//                pageBackgroundColor: $pageBackgroundColor, // Now bind pageBackgroundColor
//                selectedFont: $selectedFont // Bind selectedFont to the sheet
//            )
//            .presentationDetents([.height(400)]) // Limit the height of the sheet
//            .presentationDragIndicator(.visible) // Show drag indicator
//            .presentationBackground(.softy)
//        }
//        .navigationBarBackButtonHidden(true)
//    }
//
//    // Function to save the document and trigger navigation to SavedDocListView
//    private func saveDocument() {
//        savedDocumentViewModel.addSavedDocument(content: extractedText)
//        navigateToSavedView = true // Trigger the navigation to SavedDocListView
//    }
//}


//struct ReadingPage: View {
//    @State private var fontSize: Double = 14
//    @State private var wordSpacing: Double = 1.5
//    @State private var showSettings = false
//    @State private var pageBackgroundColor: Color = Color("offwhite")
//    @State private var selectedFont: String = "Arial"
//    
//    //    @StateObject private var savedDocumentViewModel = SavedDocumentViewModel()
//    @State private var navigateToSavedView = false
//    
//    var extractedText: String  // Text passed from ExtractedText
//    
//    var body: some View {
//        NavigationView {
//            ZStack {
//                pageBackgroundColor
//                    .ignoresSafeArea()
//                
//                ScrollView {
//                    VStack(alignment: .leading, spacing: 10) {
//                       Text(extractedText)
//                            .font(.custom(selectedFont, size: fontSize))
//                            .kerning(wordSpacing)
//                            .padding([.leading, .trailing])
//                    }
//                    .padding()
//                }
//                .scrollIndicators(.visible)
//                
//                        
//            }
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
//                
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    Button(action: {
//                        showSettings.toggle()
//                    }) {
//                        Text("Settings")
//                            .foregroundColor(.black)
//                        Image(systemName: "gearshape.fill")
//                            .resizable()
//                            .foregroundColor(.black)
//                    }
//                }
//            }
//        }
//        .sheet(isPresented: $showSettings) {
//            SettingsSheetView(
//                fontSize: $fontSize,
//                wordSpacing: $wordSpacing,
//                pageBackgroundColor: $pageBackgroundColor,
//                selectedFont: $selectedFont
//            )
//            .presentationDetents([.height(400)])
//            .presentationDragIndicator(.visible)
//            .presentationBackground(.softy)
//        }
//        .navigationBarBackButtonHidden(true)
//    }
//    ////delete this
//    //  private func saveDocument() {
//    //     savedDocumentViewModel.addSavedDocument(content: extractedText)
//    //       navigateToSavedView = true
//    //   }
//    }
//    
//    struct SettingsSheetView: View {
//        @Binding var fontSize: Double // Binding for font size
//        @Binding var wordSpacing: Double // Binding for word spacing
//        @Binding var pageBackgroundColor: Color // Binding for page background color
//        @Binding var selectedFont: String // Binding for selected font
//        
//        let availableFonts = [
//            "Arial",
//            "Noto Sans Arabic",
//            "Lexie Readable",
//            "Maqroo-Regular", // Correct PostScript name for your custom font
//            "OpenDyslexic"
//        ]
//        
//        var body: some View {
//            VStack {
//                // Font Selection Section
//                HStack {
//                    Text("Font type:")
//                        .foregroundColor(Color.black)
//                        .font(.body)
//                        .padding(.trailing, 10) // Add padding to space out the label
//                    
//                    // Use Menu instead of Picker for more control
//                    Menu {
//                        ForEach(availableFonts, id: \.self) { font in
//                            Button(action: {
//                                selectedFont = font
//                            }) {
//                                Text(font)
//                                    .foregroundColor(.black) // Set menu item text color to black
//                            }
//                        }
//                    } label: {
//                        HStack {
//                            Text(" \(selectedFont)")
//                                .foregroundColor(.black) // Set selected font label text color
//                            Image(systemName: "chevron.down")
//                                .foregroundColor(.black) // Chevron icon color
//                        }
//                        .padding([.leading, .trailing])
//                        .background(Color.white)
//                        .cornerRadius(10)
//                    }
//                }
//                .padding()
//                
//                // Font Size Slider
//                VStack {
//                    Text("Font Size: \(Int(fontSize))")
//                        .foregroundColor(Color.black)
//                        .padding(.bottom, 10)
//                    Slider(value: $fontSize, in: 14...24, step: 1)
//                        .padding([.leading, .trailing])
//                        .accentColor(Color("Sage"))
//                }
//                
//                // Word Spacing Slider
//                VStack {
//                    Text("Word Spacing: \(String(format: "%.2f", wordSpacing))")
//                        .foregroundColor(Color.black)
//                        .padding(.bottom, 10)
//                    Slider(value: $wordSpacing, in: 0...8, step: 0.1)
//                        .padding([.leading, .trailing])
//                        .accentColor(Color("Sage"))
//                }
//                
//                // Page Background Color Picker (Brown scale + Offwhite + New Color)
//                VStack {
//                    Text("Background Color:")
//                        .foregroundColor(Color.black)
//                        .padding(.bottom, 10)
//                    
//                    // Stack for the color boxes
//                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))], spacing: 20) {
//                        let backgroundColors: [Color] = [
//                            Color("offwhite"),    // Default offwhite
//                            Color("LightBrown"),   // Light brown
//                            Color("yellowy"),      // Medium brown
//                            Color("lightgray")     // Light gray
//                        ]
//                        let colorNames: [String] = [
//                            "Original", "Calm", "Focus", "Paper"
//                        ]
//                        
//                        ForEach(0..<backgroundColors.count, id: \.self) { index in
//                            RoundedRectangle(cornerRadius: 10)
//                                .fill(backgroundColors[index])
//                                .frame(height: 70)
//                                .overlay(
//                                    VStack {
//                                        Text(colorNames[index]) // Color name
//                                            .font(.caption)
//                                            .foregroundColor(Color.black)
//                                            .padding(.top, 25)
//                                        Spacer()
//                                    }
//                                )
//                                .padding(5)
//                                .overlay(
//                                    RoundedRectangle(cornerRadius: 17)
//                                        .stroke(pageBackgroundColor == backgroundColors[index] ? Color("Sage") : Color.white, lineWidth: 2) // Border to indicate selection
//                                )
//                                .onTapGesture {
//                                    // Allow selecting the same color (even if it's already selected)
//                                    pageBackgroundColor = backgroundColors[index]
//                                }
//                        }
//                    }
//                    .padding([.leading, .trailing])
//                }
//            }
//        }
//    }
//    
//    struct ReadingPage_Previews: PreviewProvider {
//        static var previews: some View {
//            ReadingPage(extractedText: "Sample extracted text here هذا نص عربي ...")
//              //.environment(\.locale, .init(identifier: "ar"))
//        }
//    }
//


struct ReadingPage: View {
    @State private var fontSize: Double = 14
    @State private var wordSpacing: Double = 1.5
    @State private var lineSpacing: Double = 5.0 // Added line spacing state
    @State private var showSettings = false
    @State private var pageBackgroundColor: Color = Color("offwhite")
    @State private var selectedFont: String = "Arial"
    
    var extractedText: String  // Text passed from ExtractedText
    
    var body: some View {
        NavigationView {
            ZStack {
                pageBackgroundColor
                    .ignoresSafeArea()
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 10) {
                        Text(extractedText)
                            .font(.custom(selectedFont, size: fontSize))
                            .kerning(wordSpacing)
                            .lineSpacing(lineSpacing)  // Apply line spacing here
                            .padding([.leading, .trailing])
                    }
                    .padding()
                }
                .scrollIndicators(.visible)
                
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    NavigationLink(destination: HomePage()) {
                        HStack {
                            Image(systemName: "chevron.left")
                                .resizable()
                                .frame(width: 20, height: 20)
                            Text("Back")
                        }
                        .foregroundColor(.black)
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showSettings.toggle()
                    }) {
                        Text("Settings")
                            .foregroundColor(.black)
                        Image(systemName: "gearshape.fill")
                            .resizable()
                            .foregroundColor(.black)
                    }
                }
            }
        }
        .sheet(isPresented: $showSettings) {
            SettingsSheetView(
                fontSize: $fontSize,
                wordSpacing: $wordSpacing,
                lineSpacing: $lineSpacing, // Pass lineSpacing binding
                pageBackgroundColor: $pageBackgroundColor,
                selectedFont: $selectedFont
            )
            .presentationDetents([.height(450)])
            .presentationDragIndicator(.visible)
            .presentationBackground(.softy)
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct SettingsSheetView: View {
    @Binding var fontSize: Double
    @Binding var wordSpacing: Double
    @Binding var lineSpacing: Double // Added binding for line spacing
    @Binding var pageBackgroundColor: Color
    @Binding var selectedFont: String
    
    let availableFonts = [
        "Arial",
        "Noto Sans Arabic",
        "Lexie Readable",
        "Maqroo-Regular",
        "OpenDyslexic"
    ]
    
    var body: some View {
        VStack {
            // Font Selection Section
            HStack {
                Text("Font type:")
                    .foregroundColor(Color.black)
                    .font(.body)
                    .padding(.trailing, 10)
                
                Menu {
                    ForEach(availableFonts, id: \.self) { font in
                        Button(action: {
                            selectedFont = font
                        }) {
                            Text(font)
                                .foregroundColor(.black)
                        }
                    }
                } label: {
                    HStack {
                        Text(" \(selectedFont)")
                            .foregroundColor(.black)
                        Image(systemName: "chevron.down")
                            .foregroundColor(.black)
                    }
                    .padding([.leading, .trailing])
                    .background(Color.white)
                    .cornerRadius(10)
                }
            }
            .padding()
            
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
            
            // Line Spacing Slider
            VStack {
                Text("Line Spacing: \(String(format: "%.2f", lineSpacing))")
                    .foregroundColor(Color.black)
                    .padding(.bottom, 10)
                Slider(value: $lineSpacing, in: 0...20, step: 0.5)  // Adjust max value as needed
                    .padding([.leading, .trailing])
                    .accentColor(Color("Sage"))
            }
            
            // Page Background Color Picker
            VStack {
                Text("Background Color:")
                    .foregroundColor(Color.black)
                    .padding(.bottom, 10)
                
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))], spacing: 20) {
                    let backgroundColors: [Color] = [
                        Color("offwhite"),
                        Color("LightBrown"),
                        Color("yellowy"),
                        Color("lightgray")
                    ]
                    let colorNames: [String] = [
                        "Original", "Calm", "Focus", "Paper"
                    ]
                    
                    ForEach(0..<backgroundColors.count, id: \.self) { index in
                        RoundedRectangle(cornerRadius: 10)
                            .fill(backgroundColors[index])
                            .frame(height: 70)
                            .overlay(
                                VStack {
                                    Text(colorNames[index])
                                        .font(.caption)
                                        .foregroundColor(Color.black)
                                        .padding(.top, 25)
                                    Spacer()
                                }
                            )
                            .padding(5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 17)
                                    .stroke(pageBackgroundColor == backgroundColors[index] ? Color("Sage") : Color.white, lineWidth: 2)
                            )
                            .onTapGesture {
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
        ReadingPage(extractedText: "Sample extracted text here هذا نص عربي ...")
           // .environment(\.locale, .init(identifier: "ar"))
    }
}
