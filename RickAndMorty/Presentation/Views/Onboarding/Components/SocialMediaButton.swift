//
//  SocialMediaButton.swift
//  RickAndMorty
//
//  Created by Oziel Pontes on 18/02/25.
//

import SwiftUI

struct SocialMediaButton: View {
    let title: String?
    let icon: AppImages?
    let onTap: () -> Void?
    var body: some View {
        VStack {
            Text(title ?? "-")
                .font(.headline)
                .foregroundColor(.white)
                .onTapGesture {
                    onTap()
                }
            icon?
                .image()
                .resizable()
                .frame(
                    maxWidth: 30,
                    maxHeight: 30
                )

        }.padding()
    }
}

#Preview {
    SocialMediaButton(
        title: nil, icon: nil, onTap: {}
    )
}
