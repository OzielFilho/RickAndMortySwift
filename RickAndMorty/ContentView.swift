//
//  ContentView.swift
//  RickAndMorty
//
//  Created by Oziel Pontes on 18/02/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        OnboardingView(
            viewModel: OnboardingViewModel()
        )
    }
}

#Preview {
    ContentView()
}
