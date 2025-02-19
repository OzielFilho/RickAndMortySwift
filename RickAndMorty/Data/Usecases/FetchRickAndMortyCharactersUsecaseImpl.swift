//
//  FetchRickAndMortyCharactersUsecaseImpl.swift
//  RickAndMorty
//
//  Created by Oziel Pontes on 19/02/25.
//

import Foundation

class FetchRickAndMortyCharactersUsecaseImpl: FetchRickAndMortyCharactersUsecase {
    private let repository: RickAndMortyRepository

    init(repository: RickAndMortyRepository) {
        self.repository = repository
    }

    func execute() async throws -> [RickAndMortyCharacter] {
        return try await repository.fetchCharacters()
    }
}
