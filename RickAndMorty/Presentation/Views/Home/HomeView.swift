//
//  HomeView.swift
//  RickAndMorty
//
//  Created by Oziel Pontes on 19/02/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = RickAndMortyViewModel(
        fetchRickAndMoryCharacters: FetchRickAndMortyCharactersUsecaseImpl(repository: RickAndMortyRepositoryImpl(httpClient: HttpAdapter()))
    )

    var body: some View {
        NavigationView {
            if viewModel.isLoading {
                ProgressView()
            } else {
                List(viewModel.characters, id: \.id) {
                    character in
                    HStack {
                        AsyncImage(url: URL(string: character.image)) { image in
                            image.resizable().scaledToFit()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())

                        VStack(alignment: .leading) {
                            Text(character.name).font(.headline)
                            Text(character.species).font(.subheadline).foregroundColor(.gray)
                        }
                    }
                }
                .navigationTitle("Personagens")
                .task {
                    await viewModel.fetchCharacters()
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
