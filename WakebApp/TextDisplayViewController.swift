//
//  TextDisplayViewController.swift
//  WakebApp
//
//  Created by Diala Abdulnasser Fayoumi on 17/06/1446 AH.
//
import UIKit
import Combine
import SwiftUICore

class TextDisplayViewController: UIViewController {
    @ObservedObject var viewModel: TextScannerViewModel
    private var textView: UITextView!
    private var cancellables: Set<AnyCancellable> = []

    init(viewModel: TextScannerViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextView()
        
        // Observe changes to recognizedText and update the textView
        viewModel.$recognizedText
            .receive(on: DispatchQueue.main) // Ensure UI updates are on the main thread
            .assign(to: \.text, on: textView) // Bind textView's text to recognizedText
            .store(in: &cancellables) // Store the cancellable to avoid memory leaks
    }

    private func setupTextView() {
        textView = UITextView(frame: view.bounds)
        textView.isEditable = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textView)

        NSLayoutConstraint.activate([
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            textView.topAnchor.constraint(equalTo: view.topAnchor),
            textView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
