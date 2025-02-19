//
//  HttpAdapter.swift
//  RickAndMorty
//
//  Created by Oziel Pontes on 19/02/25.
//

import Foundation

class HttpAdapter: HttpClient {
    func get<T: Decodable>(url: String) async throws -> T {
        guard let url = URL(string: url) else {
            fatalError("Invalid URL: \(url)")
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()

        let response = try decoder.decode(T.self, from: data)
        return response
    }
}
