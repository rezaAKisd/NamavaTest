//
//  MovieDetailViewModel.swift
//  NamavaTest
//
//  Created by reza akbari on 7/23/22.
//

import RxSwift
import RxCocoa
import RxSwiftExt
import Resolver

struct MovieDetailViewModel {
    
    let disposeBag = DisposeBag()
    let movie: BehaviorRelay<MovieEntity?> = .init(value: nil)
    
    @Injected var model: MovieDetailModel
    
    init() {
        subscribeOnMovieModel()
    }
    
    private func subscribeOnMovieModel(){
        model.movie
            .asObservable()
            .bind(to: movie)
            .disposed(by: disposeBag)
    }
}


