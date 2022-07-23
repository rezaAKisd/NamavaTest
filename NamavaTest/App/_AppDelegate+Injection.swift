//
//  _AppDelegate+Injection.swift
//  NamavaTest
//
//  Created by reza akbari on 7/23/22.
//

import Foundation
import Resolver

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        
        registerServices()
        registerSearchMovie()
        registerMovieDetail()
    }
}
