//
//  RickAndMortyRepository.swift
//  RickAndMorty
//
//  Created by Oziel Pontes on 19/02/25.
//

import Foundation

protocol RickAndMortyRepository {
    func fetchCharacters() async throws -> [RickAndMortyCharacter]
}
