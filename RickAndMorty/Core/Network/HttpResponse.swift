//
//  HttpResponse.swift
//  RickAndMorty
//
//  Created by Oziel Pontes on 19/02/25.
//

import Foundation

struct HttpResponse<T: Decodable>: Decodable {
    let data: T
}
