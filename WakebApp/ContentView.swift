//
//  ContentView.swift
//  WakebApp
//
import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = TextScannerViewModel()

    var body: some View {
        NavigationView {
            CameraView(viewModel: viewModel)
                .navigationTitle("Document Scanner")
                .navigationBarHidden(true) 
        }
    }
}
#Preview {
    ContentView()
}
