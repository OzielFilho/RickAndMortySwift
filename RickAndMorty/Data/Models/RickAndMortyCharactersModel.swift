//
//  RickAndMortyCharactersModel.swift
//  RickAndMorty
//
//  Created by Oziel Pontes on 19/02/25.
//

import Foundation

struct RickAndMortyCharactersModel: Decodable, Equatable {
    let info: RickAndMortyCharacterInfo
    let results: [RickAndMortyCharacter]

    func toDomain() -> RickAndMortyCharacters {
        return RickAndMortyCharacters(
            info: info,
            results: results
        )
    }
}
