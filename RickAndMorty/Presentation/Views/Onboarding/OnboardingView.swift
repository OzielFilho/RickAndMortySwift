import SwiftUI

struct OnboardingView: View {
    @ObservedObject var viewModel: OnboardingViewModel

    let backgroundImage = AppImages.OnboardingBackground

    func openExternalLink(url: String) {
        OpenExternalLinkService.open(url: url)
    }

    var body: some View {
        if viewModel.showSplash {
            splashSection
        } else {
            NavigationView {
                GeometryReader { geometry in
                    onboardingContent(geometry: geometry)
                        .background(backgroundImageSection)
                        .ignoresSafeArea()
                }
                .navigationBarHidden(true)
            }
        }
    }

    private var splashSection: some View {
        SplashView()
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    withAnimation {
                        self.viewModel.showSplash = false
                    }
                }
            }
    }

    private func onboardingContent(geometry: GeometryProxy) -> some View {
        VStack {
            RickAndMortyLogo(geometry: geometry)
            mainContent(geometry: geometry)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    private func mainContent(geometry: GeometryProxy) -> some View {
        VStack {
            NavigationLink("Go to characters", destination: HomeView())
                .padding()
                .font(.title)
                .foregroundStyle(.white)
                .buttonStyle(.bordered)

            Spacer().frame(height: geometry.safeAreaInsets.bottom)

            socialMediaButtons
        }
        .padding()
    }

    private var socialMediaButtons: some View {
        HStack {
            SocialMediaButton(title: "GitHub", icon: AppImages.GitHub, onTap: {
                openExternalLink(url: ExternalLinks.PersonalGitHub.getURL())
            })

            SocialMediaButton(title: "Linkedin", icon: AppImages.Linkedin, onTap: {
                openExternalLink(url: ExternalLinks.PersonalLinkedin.getURL())
            })
        }
    }

    private var backgroundImageSection: some View {
        backgroundImage.image()
            .resizable()
            .scaledToFill()
            .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    OnboardingView(viewModel: OnboardingViewModel())
}
