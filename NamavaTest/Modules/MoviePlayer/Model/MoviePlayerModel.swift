//
//  MoviePlayerModel.swift
//  NamavaTest
//
//  Created by reza akbari on 7/23/22.
//

import RxSwift
import RxCocoa

struct MoviePlayerModel {
    
    let disposeBag = DisposeBag()
    let defaultMovieUrl: BehaviorRelay<String> = .init(value: "https://aspb23.cdn.asset.aparat.com/aparat-video/40d10241a2b595599bcc41f4bdb4691b29471831-480p.mp4?wmsAuthSign=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbiI6ImNiMGQxNmQ3MDdiNTM0MmU1OGRjYmU2ZGVjZmMxZTY3IiwiZXhwIjoxNjU4NjAxOTcyLCJpc3MiOiJTYWJhIElkZWEgR1NJRyJ9.v_pvcnSsSZdvtLPXKsoNJYt8VdIypqy7WDrRiAxEgTk")
    
    init() { }
}
