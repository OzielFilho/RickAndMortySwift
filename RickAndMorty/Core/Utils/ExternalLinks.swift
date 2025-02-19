//
//  ExternalLinks.swift
//  RickAndMorty
//
//  Created by Oziel Pontes on 18/02/25.
//

import Foundation

enum ExternalLinks {
    case PersonalGitHub
    case PersonalLinkedin

    func getURL() -> String {
        switch self {
        case .PersonalGitHub:
            return "https://github.com/OzielFilho"
        case .PersonalLinkedin:
            return "https://www.linkedin.com/in/oziel-pontes/"
        }
    }
}
