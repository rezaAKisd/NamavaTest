//
//  SearchMovieEntity.swift
//  NamavaTest
//
//  Created by reza akbari on 7/23/22.
//

import Foundation

struct SearchMovieEntity: Codable {
    let data: [MovieEntity]

    enum CodingKeys: String, CodingKey {
        case data
    }
}
