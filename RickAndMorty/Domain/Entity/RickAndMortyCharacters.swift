//
//  RickAndMortyCharacters.swift
//  RickAndMorty
//
//  Created by Oziel Pontes on 19/02/25.
//

import Foundation

struct RickAndMortyCharacters: Decodable, Equatable {
    let info: RickAndMortyCharacterInfo
    let results: [RickAndMortyCharacter]

    init(info: RickAndMortyCharacterInfo, results: [RickAndMortyCharacter]) {
        self.info = info
        self.results = results
    }
}
