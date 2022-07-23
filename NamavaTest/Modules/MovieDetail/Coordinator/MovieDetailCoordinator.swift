//
//  MovieDetailCoordinator.swift
//  NamavaTest
//
//  Created by reza akbari on 7/23/22.
//

import Foundation
import Resolver

protocol MovieDetailFlow: Coordinator {
    func coordinateToMoviePlayer(with movie: MovieEntity?)
}

class MovieDetailCoordinator: MovieDetailFlow {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    var movie: MovieEntity!
    
    lazy var moviePlayerCoordinator: MoviePlayerCoordinator = {
        return MoviePlayerCoordinator(navigationController: navigationController)
    }()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let movieDetailViewController: MovieDetailViewController = Resolver.resolve()
        movieDetailViewController.coordinator = self
        movieDetailViewController.viewModel.model.movie.accept(movie)
        navigationController.pushViewController(movieDetailViewController, animated: true)
    }
    
    // MARK: - Flow Methods
    func coordinateToMoviePlayer(with movie: MovieEntity?) {
        moviePlayerCoordinator.movie = movie
        childCoordinators.append(moviePlayerCoordinator)
        coordinate(to: moviePlayerCoordinator)
    }
}
