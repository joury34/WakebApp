////


import SwiftUI

struct BoardingPage: View {
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false
    
    init() {
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor.sage
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.lighttGray
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(UIColor(.offWhite)) // Background color
                    .ignoresSafeArea()
                
                TabView {
                                    OnboardingPageView(
                                        title: NSLocalizedString("Welcome to Wakeb", comment: "Welcome to Wakeb"),
                                        description: NSLocalizedString("Scan, edit, and enhance text seamlessly with Wakeb's smart features!", comment: "Welcome page description"),
                                        imageName: "text.viewfinder", // Adjust your image name
                                        showStartButton: false,
                                        showSkipButton: true
                                    )
                                    .tag(0)

                                    OnboardingPageView(
                                        title: NSLocalizedString("Scan and Upload Text", comment: "Scan and Upload Text"),
                                        description: NSLocalizedString("Easily scan documents using your camera or upload files from your device.", comment: "Easily scan documents using your camera or upload files from your device"),
                                        imageName: "doc.viewfinder", // Adjust your image name
                                        showStartButton: false,
                                        showSkipButton: true
                                    )
                                    .tag(1)

                                    OnboardingPageView(
                                        title: NSLocalizedString("Customize Your Reading Experience", comment: "Customize Your Reading Experience"),
                                        description: NSLocalizedString("Adjust fonts, spacing, and more for accessible and personalized reading experience.", comment: "Adjust fonts, spacing, and more for accessible and personalized reading experience."),
                                        imageName: "slider.horizontal.3", // Adjust your image name
                                        showStartButton: true,
                                        showSkipButton: false
                                    )
                                    .tag(2)
                                    .padding(.top, 240)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            }
        }
    }
}

struct OnboardingPageView: View {
    @AppStorage("hasSeenOnboarding") private var hasSeenOnboarding = false
    
    var title: String
    var description: String
    var imageName: String
    var showStartButton: Bool
    var showSkipButton: Bool

    var body: some View {
        VStack {
            ZStack {
                HStack {
                    Spacer()
                    if showSkipButton {
                        Button(action: {
                                            UserDefaults.standard.set(true, forKey: "hasSeenOnboarding")
                                        }) {
                                            NavigationLink(destination: HomePage()) {
                                                Text(showStartButton ? "START" : "SKIP")
                                                    .foregroundColor(showStartButton ? .sage : .black)
                                    .font(.system(size: 16, weight: .bold))
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 10)
                            }
                            Spacer()
                                .padding(.horizontal, 20)
                                .padding(.top, 40)
                        }
                    }
                }
            }

            Spacer()

            // Onboarding Image
            Image(systemName: imageName) // Replace with actual image names
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(.sage)

            // Title
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.top, 20)

            // Description
            Text(description)
                .font(.body)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 30)
                .padding(.top, 10)

            Spacer()

            // Start Button (only on the last onboarding screen)
            if showStartButton {
                Button(action: {
                    // Mark onboarding as completed
                    UserDefaults.standard.set(true, forKey: "hasSeenOnboarding")
                }) {
                    NavigationLink(destination: HomePage()) {
                        Text("START")
                            .foregroundColor(.sage)
                            .font(.system(size: 20, weight: .bold))
                            .padding(.bottom, 130)
                    }
                }
            }
        }
    }
}

#Preview {
    BoardingPage()
}
