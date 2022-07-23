//
//  MovieEntity.swift
//  NamavaTest
//
//  Created by reza akbari on 7/23/22.
//

import Foundation

struct MovieEntity: Codable {
    let name, description: String?
    let pictures: PictureEntity?
    let metadata: MetaDataEntity?

    enum CodingKeys: String, CodingKey {
        case name, description, pictures, metadata
    }
}
