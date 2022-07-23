//
//  PictureEntity.swift
//  NamavaTest
//
//  Created by reza akbari on 7/23/22.
//

import Foundation

struct PictureEntity: Codable {
    let sizes: [SizeEntity]

    enum CodingKeys: String, CodingKey {
        case sizes
    }
}
