//
//  RickAndMortyRepositoryImpl.swift
//  RickAndMorty
//
//  Created by Oziel Pontes on 19/02/25.
//

class RickAndMortyRepositoryImpl: RickAndMortyRepository {
    private let httpClient: HttpClient

    init(httpClient: HttpClient) {
        self.httpClient = httpClient
    }

    func fetchCharacters() async throws -> [RickAndMortyCharacter] {
        let endpoint = Endpoints.characters
        let response: FetchRickAndMortyCharactersResponse = try await httpClient.get(url: endpoint)
        return response.results
    }
}
