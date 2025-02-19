//
//  HttpClient.swift
//  RickAndMorty
//
//  Created by Oziel Pontes on 19/02/25.
//

import Foundation

protocol HttpClient {
    func get<T: Decodable>(url: String) async throws -> T
}
