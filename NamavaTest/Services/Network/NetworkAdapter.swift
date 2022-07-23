//
//  NetworkAdapter.swift
//  NamavaTest
//
//  Created by reza akbari on 7/23/22.
//

import Moya
import Resolver
import RxSwift

final class NetworkAdapter{
    @Injected var provider: MoyaProvider<MultiTarget>
    
    func request<T: TargetType>(_ target: T) -> Single<Response> {
        return provider.rx
               .request(MultiTarget(target))
               .filterSuccessfulStatusCodes()
               .filterSuccess()
               .observe(on: MainScheduler.instance)
    }
}
