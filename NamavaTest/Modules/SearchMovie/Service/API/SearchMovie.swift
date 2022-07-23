//
//  SearchMovie.swift
//  NamavaTest
//
//  Created by reza akbari on 7/23/22.
//

import Moya

enum SearchMovie{
    case searchMovie(String)
}

extension SearchMovie: TargetType{
    public var baseURL: URL {
        return URL(string: "https://api.vimeo.com")!
    }

    public var headers: [String: String]? {
        switch self {
        case .searchMovie(_):
            return ["Authorization": "Bearer b5e551f0567b6979cce0b9ef9987813f"]
        }
    }

    public var method: Moya.Method {
        return .get
    }
    
    public var path: String {
        return "/videos"
    }

    public var sampleData: Data {
        return Data()
    }

    public var task: Task {
        switch self {
        case .searchMovie(let searchText):
            return .requestParameters(parameters: ["query": searchText], encoding: URLEncoding.queryString)
        }
    }

    public var validationType: ValidationType {
        return .successAndRedirectCodes
    }

    var authorizationType: AuthorizationType? {
        .none
    }
}
