//
//  SearchMovieViewModel.swift
//  NamavaTest
//
//  Created by reza akbari on 7/23/22.
//

import RxSwift
import RxCocoa
import RxSwiftExt
import Resolver

struct SearchMovieViewModel {
    
    let disposeBag = DisposeBag()
    let section = PublishSubject<MovieSectionModelType?>()
    let searchText: BehaviorRelay<String?> = .init(value: nil)
    
    @Injected private var model: MoviesModel
    
    private(set) var selectedCountries: [String] = []
    
    init(){                  
        subscribeCountriesFromModel()
        subscribeOnSearch()
    }
    
    private func subscribeCountriesFromModel() {
        model.movies
            .asObservable()
            .toMovieSectionCellItems()
            .toProviderSectionModel(searchText: searchText)
            .bind(to: section)
            .disposed(by: disposeBag)
    }
    
    private func subscribeOnSearch() {
        searchText
            .asObservable()
            .bind(onNext: model.searchMovieWith(text:))
            .disposed(by: disposeBag)
    }
}
