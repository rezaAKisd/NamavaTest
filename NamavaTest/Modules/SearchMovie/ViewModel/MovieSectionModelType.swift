//
//  MovieSectionModelType.swift
//  NamavaTest
//
//  Created by reza akbari on 7/23/22.
//

import RxDataSources
import RxSwift
import RxCocoa

enum MovieSectionModelType {
    case moviesSection(header: String, items: [MoviesSectionCellType])
}

enum MoviesSectionCellType {
    case movieItem(_ model: MovieEntity)
    case loading
    case placeHolder
}

extension MovieSectionModelType: SectionModelType {
    
    typealias Item = MoviesSectionCellType
    
    var items: [MoviesSectionCellType] {
        switch self {
        case .moviesSection(header: _, items: let items):
            return items.map({ $0 })
        }
    }
    
    init(original: MovieSectionModelType, items: [Item]) {
        switch original {
        case let .moviesSection(header: header, items: _):
            self = .moviesSection(header: header, items: items)
        }
    }
}

extension MovieSectionModelType {
    var header: String {
        switch self {
        case .moviesSection(header: let header, items: _):
            return header
        }
    }
}


extension Observable where Element == [MovieEntity] {
    func toMovieSectionCellItems() -> Observable<[MoviesSectionCellType]?> {
        self.map({ $0.map({ MoviesSectionCellType.movieItem($0) }) })
    }
}

extension Observable where Element == [MoviesSectionCellType]? {
    func toProviderSectionModel(searchText: BehaviorRelay<String?>) -> Observable<MovieSectionModelType?> {
        self.map({
            if searchText.value == ""{
                return MovieSectionModelType.moviesSection(header: "", items: [.placeHolder])
            }else{
                return ($0?.isEmpty ?? true) ?  MovieSectionModelType.moviesSection(header: "", items: [.loading]) : MovieSectionModelType.moviesSection(header: "Movies", items: $0!)
            }
        })
    }
}
