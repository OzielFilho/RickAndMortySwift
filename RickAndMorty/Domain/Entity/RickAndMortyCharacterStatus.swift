//
//  RickAndMortyCharacterStatus.swift
//  RickAndMorty
//
//  Created by Oziel Pontes on 19/02/25.
//

import Foundation

enum RickAndMortyCharacterStatus: String, Codable, CaseIterable {
    case alive
    case dead
    case unknown

    init?(rawValue: String) {
        self = RickAndMortyCharacterStatus
            .allCases
            .first { $0.rawValue.lowercased() == rawValue.lowercased() } ?? .unknown
    }

    func iconText() -> String {
        switch self {
        case .alive:
            return "😎"
        case .dead:
            return "☠️"
        case .unknown:
            return "❓"
        }
    }
}
