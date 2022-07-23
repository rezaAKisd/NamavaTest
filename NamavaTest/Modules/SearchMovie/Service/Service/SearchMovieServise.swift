//
//  SearchMovieServise.swift
//  NamavaTest
//
//  Created by reza akbari on 7/23/22.
//

import RxCocoa
import RxSwift
import Resolver

protocol SearchMovieServiceProtocol{
    func searchMovie(for text: String) -> Single<[MovieEntity]>
}


struct SearchMovieService: SearchMovieServiceProtocol{
    @Injected var networkService: NetworkAdapter
    
    let countries = BehaviorRelay<MovieEntity?>(value: nil)
    
    func searchMovie(for text: String) -> Single<[MovieEntity]> {
        networkService.request(SearchMovie.searchMovie(text))
            .mapData(SearchMovieEntity.self)
            .map({ $0.data })
    }
}
