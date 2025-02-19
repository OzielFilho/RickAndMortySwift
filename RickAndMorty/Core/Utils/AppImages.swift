//
//  AppImages.swift
//  RickAndMorty
//
//  Created by Oziel Pontes on 18/02/25.
//

import SwiftUI

enum AppImages {
    case RickAndMortyLogo
    case OnboardingBackground
    case GitHub
    case RickAndMortyCharacter
    case Linkedin

    func image() -> Image {
        switch self {
        case .RickAndMortyLogo:
            return Image(fileName())
        case .OnboardingBackground:
            return Image(fileName())
        case .GitHub:
            return Image(fileName())
        case .RickAndMortyCharacter:
            return Image(fileName())
        case .Linkedin:
            return Image(fileName())
        }
    }

    private func fileName() -> String {
        switch self {
        case .RickAndMortyLogo:
            return "rick_and_morty_logo"
        case .OnboardingBackground:
            return "background_onboarding"
        case .GitHub:
            return "github"
        case .RickAndMortyCharacter:
            return "rick_and_morty_space"
        case .Linkedin:
            return "linkedin"
        }
    }
}
