//
//  MyAPIError.swift
//  NamavaTest
//
//  Created by reza akbari on 7/23/22.
//

import Foundation

enum MyAPIError: Error {
    case requestNotFormed
    
    var errorDescription: String? {
        switch self {
        case .requestNotFormed: return "request not found."
        }
    }
}
