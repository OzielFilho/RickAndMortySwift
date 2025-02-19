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

    func fetchCharacters(page: Int? = nil) async throws -> RickAndMortyCharacters {
        var endpoint = Endpoints.characters
        if let page = page {
            endpoint = "\(endpoint)?page=\(page)"
        }
        let response: RickAndMortyCharacters = try await httpClient.get(url: endpoint)
        return response
    }
}
