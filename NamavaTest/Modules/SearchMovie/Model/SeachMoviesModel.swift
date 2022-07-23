//
//  MovieModel.swift
//  NamavaTest
//
//  Created by reza akbari on 7/23/22.
//

import RxSwift
import RxCocoa
import Resolver

struct SeachMoviesModel {
    
    @Injected var service: SearchMovieServiceProtocol
    let disposeBag = DisposeBag()
    let movies = BehaviorRelay<[MovieEntity]>(value: [])
    
    init() {}
}


extension SeachMoviesModel {
    
    func searchMovieWith(text: String?) {
        guard let `text` = text,
              !text.isEmpty else {
            movies.accept([])
            return
        }
        
        movies.accept([])
        
        service
            .searchMovie(for: text)
            .asObservable()
            .share()
            .catchAndReturn([])
            .bind(to: movies)
            .disposed(by: disposeBag)
    }
}
