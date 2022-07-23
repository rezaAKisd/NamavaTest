//
//  _SearchMovie+Injection.swift
//  NamavaTest
//
//  Created by reza akbari on 7/23/22.
//

import Foundation
import Resolver

extension Resolver {
    public static func registerSearchMovie() {
        defaultScope = .graph
        
        register { SeachMoviesModel() }
        register { SearchMovieService() as SearchMovieServiceProtocol }
        register { SearchMovieViewModel() }
        register { SearchMovieViewController() }
    }
}
