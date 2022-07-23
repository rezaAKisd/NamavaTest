//
//  SizeEntity.swift
//  NamavaTest
//
//  Created by reza akbari on 7/23/22.
//

import Foundation

struct SizeEntity: Codable {
    let linkWithPlayButton: String?

    enum CodingKeys: String, CodingKey {
        case linkWithPlayButton = "link_with_play_button"
    }
}
