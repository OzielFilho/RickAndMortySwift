//
//  RickAndMortyCharacter.swift
//  RickAndMorty
//
//  Created by Oziel Pontes on 19/02/25.
//

import Foundation

struct RickAndMortyCharacter: Decodable, Equatable {
    let id: Int
    let name: String
    let image: String
    let status: RickAndMortyCharacterStatus
    let species: String
}
