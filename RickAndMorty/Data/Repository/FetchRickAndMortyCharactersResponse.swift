//
//  FetchRickAndMortyCharactersResponse.swift
//  RickAndMorty
//
//  Created by Oziel Pontes on 19/02/25.
//

import Foundation

struct FetchRickAndMortyCharactersResponse: Decodable {
    let results: [RickAndMortyCharacter]
}
