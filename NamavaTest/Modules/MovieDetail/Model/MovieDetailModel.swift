//
//  MovieDetailModel.swift
//  NamavaTest
//
//  Created by reza akbari on 7/23/22.
//

import RxSwift
import RxCocoa

struct MovieDetailModel {
    
    let disposeBag = DisposeBag()
    let movie = BehaviorRelay<MovieEntity?>(value: nil)
    
    init() { }
}

