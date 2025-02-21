import SwiftUI

struct CharacterDetails: View {
    let character: RickAndMortyCharacter?

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                characterImage
                characterName
                characterInfo
                divider
                episodeList
                divider
                Spacer()
            }
            .padding()
        }
        .background(AppColors.primaryColor)
    }

    private var characterImage: some View {
        AsyncImage(url: URL(string: character!.image)) { image in
            image.resizable().scaledToFit()
        } placeholder: {
            ProgressView()
        }
        .frame(maxWidth: .infinity)
        .clipShape(Rectangle())
        .padding(.horizontal)
    }

    private var characterName: some View {
        Text(character!.name)
            .font(.largeTitle).bold()
            .foregroundColor(AppColors.secondaryColor)
            .frame(maxWidth: .infinity)
            .multilineTextAlignment(.center)
            .padding(.horizontal)
    }

    private var characterInfo: some View {
        HStack {
            statusText
            genderText
            speciesText
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .lineLimit(1)
        .multilineTextAlignment(.center)
        .minimumScaleFactor(0.7)
    }

    private var statusText: some View {
        Text("Status: \(character!.status.iconText())")
            .font(.headline)
            .foregroundColor(AppColors.secondaryColor)
            .layoutPriority(1)
    }

    private var genderText: some View {
        Text("Gender: \(character!.gender)")
            .font(.headline)
            .foregroundColor(AppColors.secondaryColor)
            .layoutPriority(1)
    }

    private var speciesText: some View {
        Text("Species: \(character!.species)")
            .font(.headline)
            .foregroundColor(AppColors.secondaryColor)
            .layoutPriority(1)
    }

    private var divider: some View {
        Divider()
            .background(AppColors.secondaryColor)
    }

    private var episodeList: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Episodes:")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(AppColors.secondaryColor)

            ForEach(character!.formattedEpisodes, id: \.self) { episode in
                Text(episode)
                    .foregroundColor(AppColors.secondaryColor)
                    .font(.body)
                    .padding(.vertical, 8)
            }
        }
    }
}

#Preview {
    CharacterDetails(character: nil)
}
