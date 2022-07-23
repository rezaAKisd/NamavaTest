//
//  RxSwift+MoyaMapper.swift
//  NamavaTest
//
//  Created by reza akbari on 7/23/22.
//

import RxSwift
import Moya

extension PrimitiveSequence where Trait == SingleTrait, Element == Response {
    /// If the Response status code is in the 200 - 299 range, it lets the Response through.
    /// If it's outside that range, it tries to map the Response into an AirVisualErrorResponse
    /// object and throws an AirVisualError with the appropriate message from AirVisualErrorResponse.
    func filterSuccess() -> Single<Element> {
        return flatMap { response in
            guard (200...299).contains(response.statusCode) else {
                ///can parse error and throw each type of error
                
                throw MyAPIError.requestNotFormed
            }
            return .just(response)
        }
    }
    
    func mapData<T: Decodable>(_ type: T.Type) -> Single<T> {
        return flatMap { (response : Response) -> Single<T> in
            return Single.just(try response.map(type))
        }
    }
}
