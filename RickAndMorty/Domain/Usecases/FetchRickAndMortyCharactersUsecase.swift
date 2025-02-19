//
//  FetchRickAndMortyCharactersUsecase.swift
//  RickAndMorty
//
//  Created by Oziel Pontes on 19/02/25.
//

import Foundation

protocol FetchRickAndMortyCharactersUsecase {
    func execute() async throws -> [RickAndMortyCharacter]
}
