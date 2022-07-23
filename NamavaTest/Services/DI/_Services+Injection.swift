//
//  DI.swift
//  NamavaTest
//
//  Created by reza akbari on 7/23/22.
//

import Resolver
import Moya

extension Resolver{
    public static func registerServices(){
        defaultScope = .graph
        
        register { NetworkAdapter() }.scope(.application)
        register { MoyaProvider<MultiTarget>() }
    }
}
