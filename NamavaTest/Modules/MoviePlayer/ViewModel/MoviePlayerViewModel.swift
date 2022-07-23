//
//  MoviePlayerViewModel.swift
//  NamavaTest
//
//  Created by reza akbari on 7/23/22.
//

import RxSwift
import RxCocoa
import RxSwiftExt
import Resolver

struct MoviePlayerViewModel {
    
    let disposeBag = DisposeBag()
    let movieUrl: BehaviorRelay<String?> = .init(value: nil)
    
    @Injected var model: MoviePlayerModel
    
    init() {
        subscribeOnDefaultMovie()
    }
    
    private func subscribeOnDefaultMovie(){
        model.defaultMovieUrl
            .asObservable()
            .bind(to: movieUrl)
            .disposed(by: disposeBag)
    }
}

