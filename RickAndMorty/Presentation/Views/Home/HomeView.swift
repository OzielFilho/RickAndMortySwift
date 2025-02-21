import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = RickAndMortyViewModel(
        fetchRickAndMoryCharacters: FetchRickAndMortyCharactersUsecaseImpl(
            repository: RickAndMortyRepositoryImpl(
                httpClient: HttpAdapter()))
    )

    init() {
        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = [.foregroundColor: UIColor.secondary]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.secondary]
        appearance.backgroundColor = UIColor.primary
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    headerSection
                    charactersList
                }
                .padding(.horizontal)
            }
            .background(
                AppImages.OnboardingBackground.image()
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
            )
        }
        .task {
            await viewModel.fetchCharacters()
        }
        .navigationBarHidden(true)
    }

    private var headerSection: some View {
        AppImages.RickAndMortyLogo.image()
            .resizable()
            .scaledToFit()
            .frame(height: 200)
            .padding(.top, 16)
    }

    private var charactersList: some View {
        LazyVStack(spacing: 12) {
            ForEach(viewModel.characters, id: \.id) { character in
                characterRow(character: character)
                    .onAppear {
                        if viewModel.characters.last == character {
                            Task {
                                await viewModel.fetchCharacters(more: true)
                            }
                        }
                    }
            }
        }
    }

    private func characterRow(character: RickAndMortyCharacter) -> some View {
        NavigationLink(destination: CharacterDetails(character: character)) {
            HStack(spacing: 16) {
                characterImage(imageURL: character.image)
                characterDetails(character: character)
                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity, minHeight: 80)
            .background(AppColors.primaryColor)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(radius: 2)
        }
    }

    private func characterImage(imageURL: String) -> some View {
        AsyncImage(url: URL(string: imageURL)) { image in
            image.resizable()
                .scaledToFill()
        } placeholder: {
            ProgressView()
        }
        .frame(width: 60, height: 60)
        .clipShape(Circle())
    }

    private func characterDetails(character: RickAndMortyCharacter) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text(character.name)
                    .font(.headline)
                    .foregroundColor(AppColors.secondaryColor)
                Text(character.status.iconText())
                    .foregroundColor(AppColors.secondaryColor)
            }

            Text(character.species)
                .font(.subheadline)
                .foregroundColor(AppColors.secondaryColor)
        }
    }
}

#Preview {
    HomeView()
}
