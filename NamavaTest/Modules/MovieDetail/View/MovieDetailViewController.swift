//
//  MovieDetailViewController.swift
//  NamavaTest
//
//  Created by reza akbari on 7/23/22.
//

import UIKit
import RxSwift
import RxCocoa
import RxGesture
import Resolver
import Kingfisher

class MovieDetailViewController: UIViewController {

    //MARK: -Outlets
    
    @IBOutlet weak var movietTitleLable: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var moviePlayCountLabel: UILabel!
    @IBOutlet weak var movieLikeCountLabel: UILabel!
    @IBOutlet weak var movieCommentCountLabel: UILabel!
    @IBOutlet weak var movieDescriptionLabel: UILabel!
    
    //MARK: -Properties
    
    private let disposeBag = DisposeBag()
    weak var coordinator: MovieDetailFlow?
    @Injected var viewModel: MovieDetailViewModel
    
    //MARK: -LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bindFrom()
        configureImageView()
    }
    
    private func bindFrom(){
        viewModel.movie
            .unwrap()
            .subscribe { [weak self] movie in
            self?.configureView(with: movie)
        }.disposed(by: disposeBag)
    }
    
    deinit{
        coordinator?.removeFromParent()
    }
}

extension MovieDetailViewController{
    
    private func configureView(with movie: MovieEntity){
        self.movietTitleLable.text = movie.name
        self.movieImageView.kf.setImage(with: URL(string: movie.pictures?.sizes.last?.linkWithPlayButton ?? ""))
        self.moviePlayCountLabel.text = String(movie.metadata?.connections?.credits?.total ?? 0)
        self.movieLikeCountLabel.text = String(movie.metadata?.connections?.likes?.total ?? 0)
        self.movieCommentCountLabel.text = String(movie.metadata?.connections?.comments?.total ?? 0)
        self.movieDescriptionLabel.text = movie.description
    }
    
    private func configureImageView(){
        movieImageView.rx
            .tapGesture()
            .when(.recognized)
            .subscribe { [weak self] _ in
                guard let self = self else { return }
                self.coordinator?.coordinateToMoviePlayer(with: self.viewModel.movie.value)
            }.disposed(by: disposeBag)
    }
}
