import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            backgroundSection
            logoSection
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    private var backgroundSection: some View {
        AppImages
            .OnboardingBackground
            .image()
            .resizable()
            .scaledToFill()
            .edgesIgnoringSafeArea(.all)
            .ignoresSafeArea()
    }

    private var logoSection: some View {
        AppImages
            .RickAndMortyLogo
            .image()
            .padding()
    }
}

#Preview {
    SplashView()
}
