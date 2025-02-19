//
//  RickAndMortyApp.swift
//  RickAndMorty
//
//  Created by Oziel Pontes on 18/02/25.
//

import SwiftUI

@main
struct RickAndMortyApp: App {
    var body: some Scene {
        WindowGroup {
            OnboardingView(viewModel: OnboardingViewModel())
        }
    }
}

#Preview {
    OnboardingView(viewModel: OnboardingViewModel())
}
