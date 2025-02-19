//
//  SplashView.swift
//  RickAndMorty
//
//  Created by Oziel Pontes on 18/02/25.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            AppImages
                .RickAndMortyLogo
                .image()
                .padding()
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity
        )
        .background(
            AppImages
                .OnboardingBackground
                .image()
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
        ).ignoresSafeArea()
    }
}

#Preview {
    SplashView()
}
