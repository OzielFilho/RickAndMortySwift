//
//  RickAndMortyLogo.swift
//  RickAndMorty
//
//  Created by Oziel Pontes on 18/02/25.
//

import SwiftUI

struct RickAndMortyLogo: View {
    let geometry: GeometryProxy?
    var body: some View {
        Spacer().frame(height: geometry?.safeAreaInsets.top)
        AppImages.RickAndMortyLogo.image().padding()
        Spacer().frame(height: 50)
        AppImages.RickAndMortyCharacter.image().padding()
        Spacer().frame(height: 50)
    }
}

#Preview {
    RickAndMortyLogo(
        geometry: nil
    )
}
