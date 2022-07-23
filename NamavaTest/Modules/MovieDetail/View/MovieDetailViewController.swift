//
//  MovieDetailViewController.swift
//  NamavaTest
//
//  Created by reza akbari on 7/23/22.
//

import UIKit
import RxSwift
import RxCocoa
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

        bindView()
    }
    
    private func bindView(){
        viewModel.movie
            .unwrap()
            .subscribe { [weak self] movie in
            self?.configurationView(with: movie)
        }.disposed(by: disposeBag)
    }
    
    private func configurationView(with movie: MovieEntity){
        self.movietTitleLable.text = movie.name
        self.movieImageView.kf.setImage(with: URL(string: movie.pictures?.sizes.last?.linkWithPlayButton ?? ""))
        self.moviePlayCountLabel.text = String(movie.metadata?.connections?.credits?.total ?? 0)
        self.movieLikeCountLabel.text = String(movie.metadata?.connections?.likes?.total ?? 0)
        self.movieCommentCountLabel.text = String(movie.metadata?.connections?.comments?.total ?? 0)
        self.movieDescriptionLabel.text = movie.description
    }
}
