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
    private var currentPage: Int?
    private var info: RickAndMortyCharacterInfo?

    @Published var characters: [RickAndMortyCharacter] = []
    @Published var isLoading: Bool = false

    init(fetchRickAndMoryCharacters: FetchRickAndMortyCharactersUsecase) {
        self.fetchRickAndMoryCharacters = fetchRickAndMoryCharacters
    }

    func fetchCharacters(more: Bool = false) async {
        isLoading = true
        do {
            
            if more {
                if currentPage == nil {
                    currentPage = 1
                }
                
                if characters.count == info?.count || info?.pages == currentPage {
                    return
                }
                
                currentPage! += 1
            }
            let newCharacters: RickAndMortyCharacters = try await fetchRickAndMoryCharacters.execute(page: currentPage)
            info = newCharacters.info
            characters.append(contentsOf: newCharacters.results)
        } catch {
            print("Erro ao buscar personagens: \(error)")
        }
        isLoading = false
    }
}
