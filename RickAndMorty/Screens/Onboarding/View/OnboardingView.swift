import SwiftUI

struct OnboardingView: View {
    @ObservedObject var viewModel: OnboardingViewModel

    let backgroundImage = AppImages.OnboardingBackground

    func openExternalLink(url: String) {
        OpenExternalLinkService.open(url: url)
    }

    var body: some View {
        if viewModel.showSplash {
            SplashView()
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation {
                            self.viewModel.showSplash = false
                        }
                    }
                }
        } else {
            GeometryReader { geometry in
                VStack {
                    RickAndMortyLogo(geometry: geometry)
                    VStack {
                        Rectangle().frame(
                            width: geometry.size.width * 0.5, height: 50
                        )
                        .foregroundColor(AppColors.secondaryColor)
                        .cornerRadius(10)
                        .overlay(
                            Text("Iniciar Viagem")
                                .font(.title)
                                .foregroundColor(.black)
                        )

                        Spacer().frame(height: geometry.safeAreaInsets.bottom)
                        HStack {
                            SocialMediaButton(title: "GitHub", icon: AppImages.GitHub,
                                              onTap: {
                                                  openExternalLink(
                                                      url: ExternalLinks.PersonalGitHub.getURL()
                                                  )
                                              })

                            SocialMediaButton(title: "Linkedin", icon: AppImages.Linkedin,
                                              onTap: {
                                                  openExternalLink(
                                                      url:
                                                      ExternalLinks
                                                          .PersonalLinkedin.getURL()
                                                  )
                                              })
                        }
                    }
                    .padding()
                }
                .frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity
                )
                .background(
                    backgroundImage.image()
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                ).ignoresSafeArea()
            }
        }
    }
}

#Preview {
    OnboardingView(
        viewModel: OnboardingViewModel()
    )
}
