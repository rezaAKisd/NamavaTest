//
//  MoviePlayerViewController.swift
//  NamavaTest
//
//  Created by reza akbari on 7/23/22.
//

import UIKit
import AVKit
import Resolver
import RxSwift
import RxCocoa

class MoviePlayerViewController: AVPlayerViewController {
    
    //MARK: -Properties
    
    private let disposeBag = DisposeBag()
    weak var coordinator: MoviePlayerFlow?
    @Injected var viewModel: MoviePlayerViewModel
    
    //MARK: -LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindFrom()
    }
    
    private func bindFrom(){
        viewModel.movieUrl
            .unwrap()
            .subscribe(onNext: { [weak self] url in
                guard let self = self else { return }
                
                self.setupPlayer(for: url)
            }).disposed(by: disposeBag)
    }
    
    deinit{
        coordinator?.removeFromParent()
    }
}

extension MoviePlayerViewController{
    
    private func setupPlayer(for url: String){
        let player = AVPlayer(url: URL(string: url)!)
        self.player = player
        player.play()
    }
}
