//
//  MetaDataEntity.swift
//  NamavaTest
//
//  Created by reza akbari on 7/23/22.
//

import Foundation

struct MetaDataEntity: Codable {
    let connections: ConnectionEntity?

    enum CodingKeys: String, CodingKey {
        case connections
    }
}
