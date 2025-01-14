//
//  TextDisplayViewController.swift
//  WakebApp
//
//  Created by Diala Abdulnasser Fayoumi on 17/06/1446 AH.
//
//import UIKit
//import Combine
//import SwiftUICore
//import SwiftUI
//
//class TextDisplayViewController: UIViewController {
//    @ObservedObject var viewModel: TextScannerViewModel
//    private var cancellables: Set<AnyCancellable> = []
//
//    init(viewModel: TextScannerViewModel) {
//        self.viewModel = viewModel
//        super.init(nibName: nil, bundle: nil)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupNavigationButton()
//
//        // Observe changes to recognizedText
//        viewModel.$recognizedText
//            .receive(on: DispatchQueue.main)
//            .sink { [weak self] _ in
//                // Handle updates if necessary
//            }
//            .store(in: &cancellables)
//    }
//
//    private func setupNavigationButton() {
//        let viewTextButton = UIButton(type: .system)
//        viewTextButton.setTitle("Confirm", for: .normal)
//        viewTextButton.addTarget(self, action: #selector(navigateToExtractedTextPage), for: .touchUpInside)
//        viewTextButton.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(viewTextButton)
//
//        // Layout the button
//        NSLayoutConstraint.activate([
//            viewTextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            viewTextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
//        ])
//    }
//    @objc private func navigateToExtractedTextPage() {
//        // Use the correct name for the parameter in the ExtractedText view
//        let extractedTextPage = ExtractedText(recognizedText: viewModel.recognizedText)
//        let hostingController = UIHostingController(rootView: extractedTextPage)
//
//        // Navigate to the ExtractedText page
//        navigationController?.pushViewController(hostingController, animated: true)
//    }
//}
import UIKit
import Combine
import SwiftUICore
import SwiftUI

class TextDisplayViewController: UIViewController {
    @ObservedObject var viewModel: TextScannerViewModel
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
        setupView()

        // Observe changes to recognizedText
        viewModel.$recognizedText
            .receive(on: DispatchQueue.main)
            .sink { [weak self] recognizedText in
                self?.navigateToExtractedTextPage(with: recognizedText)
            }
            .store(in: &cancellables)
    }

    private func setupView() {
        view.backgroundColor = .white // Set background color for clarity
        // Additional setup if needed (e.g., labels or loading indicators)
    }

    private func navigateToExtractedTextPage(with recognizedText: String) {
        // Check if recognizedText is not empty before navigating
        guard !recognizedText.isEmpty else { return }
        
        let extractedTextPage = ExtractedText(recognizedText: recognizedText)
        let hostingController = UIHostingController(rootView: extractedTextPage)

        // Navigate to the ExtractedText page
        navigationController?.pushViewController(hostingController, animated: true)
    }
}
