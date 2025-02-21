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
    let status: RickAndMortyCharacterStatus
    let species: String
    let gender: String
    let location: RickAndMortyCharacterLocation
    let image: String
    let episode: [String]
    let type: String

    var formattedEpisodes: [String] {
        episode.compactMap { url in
            if let episodeNumber = url.components(separatedBy: "/").last {
                return "Episode \(episodeNumber)"
            }
            return nil
        }
    }
}
