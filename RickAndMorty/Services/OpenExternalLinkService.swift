//
//  OpenExternalLinkService.swift
//  RickAndMorty
//
//  Created by Oziel Pontes on 18/02/25.
//

import Foundation
import SwiftUI

class OpenExternalLinkService {
    static func open(url: String) {
        guard let url = URL(string: url) else { return }

        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
