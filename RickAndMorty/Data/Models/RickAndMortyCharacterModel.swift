//
//  RickAndMortyCharacterModel.swift
//  RickAndMorty
//
//  Created by Oziel Pontes on 19/02/25.
//

import Foundation

struct RickAndMortyCharacterModel: Decodable {
    let id: Int
    let name: String
    let image: String
    let status: String?
    let species: String

    func toDomain() -> RickAndMortyCharacter {
        return RickAndMortyCharacter(
            id: id,
            name: name,
            image: image,
            status: RickAndMortyCharacterStatus(rawValue: status ?? "unknown") ?? RickAndMortyCharacterStatus.unknown,
            species: species
        )
    }
}
