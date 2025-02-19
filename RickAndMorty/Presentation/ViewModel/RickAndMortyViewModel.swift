//
//  RickAndMortyViewModel.swift
//  RickAndMorty
//
//  Created by Oziel Pontes on 19/02/25.
//

import Foundation

@MainActor
class RickAndMortyViewModel: ObservableObject {
    private let fetchRickAndMoryCharacters: FetchRickAndMortyCharactersUsecase

    @Published var characters: [RickAndMortyCharacter] = []
    @Published var isLoading: Bool = false

    init(fetchRickAndMoryCharacters: FetchRickAndMortyCharactersUsecase) {
        self.fetchRickAndMoryCharacters = fetchRickAndMoryCharacters
    }

    func fetchCharacters() async {
        isLoading = true
        do {
            characters = try await fetchRickAndMoryCharacters.execute()
        } catch {
            print("Erro ao buscar personagens: \(error)")
        }
        isLoading = false
    }
}
