//
//  _MoviePlayer+Injection.swift
//  NamavaTest
//
//  Created by reza akbari on 7/23/22.
//

import Foundation
import Resolver

extension Resolver {
  public static func registerMoviePlayer() {
    defaultScope = .graph
      
      register { MoviePlayerModel() }
      register { MoviePlayerViewModel() }
      register { MoviePlayerViewController() }
  }
}
