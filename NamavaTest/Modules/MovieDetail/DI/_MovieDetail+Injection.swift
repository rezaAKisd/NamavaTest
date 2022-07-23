//
//  _MovieDetail+Injection.swift
//  NamavaTest
//
//  Created by reza akbari on 7/23/22.
//

import Foundation
import Resolver

extension Resolver {
  public static func registerMovieDetail() {
    defaultScope = .graph
      
      register { MovieDetailModel() }
      register { MovieDetailViewModel() }
      register { MovieDetailViewController() }
  }
}
